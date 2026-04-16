import Foundation

class Snapshotter {
    enum Behavior {
        case assert, record
    }

    // When working with Xcode, use the "Record Snapshot" scheme to
    // automatically enable the `.record` behavior
    static let shared = Snapshotter(
        behavior: ProcessInfo.processInfo.environment.keys.contains("RECORD_SNAPSHOTS")  ? .record : .assert
    )

    let behavior: Behavior
    private(set) var recordedSnapshots: [URL]
    private let fileManager: FileManager

    private init(behavior: Behavior) {
        self.behavior = behavior
        self.recordedSnapshots = []
        self.fileManager = .default
    }

    /// Processes a snapshot at the given path by either asserting a match against a stored snapshot, or rewriting it.
    func processSnapshot(at generatedURL: URL, against name: String) throws -> URL {
        let snapshotURL = snapshotLocation(for: name)

        switch behavior {
        case .assert:
            try DirectoryDiffer().compare(snapshotURL, against: generatedURL)

        case .record:
            try resetAllSnapshotsIfNeeded()
            try resetDirectory(at: snapshotURL, create: false)
            try fileManager.copyItem(at: generatedURL, to: snapshotURL)
            recordedSnapshots.append(snapshotURL)
        }

        return snapshotURL
    }

    /// The location of a generated snapshot stored on disk
    private func snapshotLocation(for name: String) -> URL {
        snapshotDirectory.appendingPathComponent(name)
    }

    /// Resets the snapshot directory only when recording all tests (no filter active).
    /// Individual snapshots are always reset via `resetDirectory(at: snapshotURL)` in `processSnapshot`.
    private func resetAllSnapshotsIfNeeded() throws {
        guard shouldResetAllSnapshots else { return }
        try resetDirectory(at: snapshotDirectory)
    }

    private var shouldResetAllSnapshots: Bool {
        guard recordedSnapshots.isEmpty else { return false }
        // Don't wipe unrelated snapshots when running a filtered subset of tests.
        // swift test --filter passes -XCTest arguments to the test runner.
        if ProcessInfo.processInfo.arguments.contains(where: { $0 == "-XCTest" }) {
            return false
        }
        return true
    }

    /// The URL to the snapshot storage directory
    var snapshotDirectory: URL {
        URL(fileURLWithPath: #filePath)
            .appendingPathComponent("..")
            .appendingPathComponent("..")
            .appendingPathComponent("..")
            .appendingPathComponent("Support")
            .appendingPathComponent("Snapshots")
            .resolvingSymlinksInPath()
    }

    /// Deletes and recreates the directory at the given location.
    private func resetDirectory(at url: URL, create: Bool = true) throws {
        if fileManager.fileExists(atPath: url.path) {
            try fileManager.removeItem(at: url)
        }

        if create {
            try fileManager.createDirectory(at: url, withIntermediateDirectories: true)
        }
    }
}
