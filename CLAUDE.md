# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

CreateAPI is a Swift command-line tool that generates Swift code from OpenAPI specifications. It produces hand-written quality code with extensive customization options, processing large specs (100K+ lines) in under a second via parallel generation.

This is a fork of an open source project that is no longer active, so we are not contributing upstream and expect no other upstream changes.

## Build Commands

```bash
# Build release (universal binary for x86_64 + arm64)
make build

# Install to /usr/local/bin
make install

# Run all tests
swift test

# Verify generated code compiles (run after recording snapshots)
./Scripts/test-generated.sh

# Generate documentation (requires Sourcery)
make documentation
```

## Testing

The test suite uses **snapshot testing** with compilation verification:

- **Snapshot tests** compare generated output against committed fixtures in `Tests/Support/Snapshots/`
- **Compilation tests** verify generated packages actually compile

### Recording Snapshots

When making changes that affect generated output:

1. In Xcode, switch to the **"Record Snapshots"** scheme
2. Run the full test suite (⌘U)
3. This sets `RECORD_SNAPSHOTS=1` and regenerates all fixtures

Alternatively, set the environment variable manually:
```bash
RECORD_SNAPSHOTS=1 swift test
```

### Adding New Test Cases

1. Add your OpenAPI spec to `Tests/Support/Specs/`
2. Add a test method in `Tests/CreateAPITests/GenerateTests.swift`
3. Run in record mode first to generate the snapshot

## Architecture

### Key Modules

- **create-api** (executable): CLI interface and generation orchestration
- **CreateOptions**: Configuration schema and option parsing (separated for testability)

### Generation Pipeline

1. **Parse**: Read OpenAPI spec (JSON/YAML) via OpenAPIKit
2. **Configure**: Load `.create-api.yaml` and merge CLI overrides
3. **Generate**: Transform spec into Swift declarations
   - `Generator+Schemas.swift` → entity/model generation
   - `Generator+Paths.swift` → API endpoint generation
   - `Generator+DataTypes.swift` → type mapping
4. **Output**: Write files via `OutputWriter`

### Core Types (in `Declarations.swift`)

- `TypeIdentifier`: Recursive enum representing all Swift types (builtin, userDefined, array, dictionary)
- `TypeName` / `PropertyName`: Wrapped identifiers for type-safe naming
- `Context`: Tracks generation state (parent types, namespaces, etc.)

### Parallelization

Generation uses `DispatchQueue.concurrentPerform()` with `NSLock` for thread safety. Disable with `--single-threaded` flag when debugging.

## Configuration

Configuration file: `.create-api.yaml` (or `.create-api.json`)

Key configuration areas in `ConfigOptions.swift`:
- `generate`: Which components to generate (entities, paths, enums, package)
- `entities.*`: Struct/class options, protocols, coding keys optimization
- `paths.*`: REST vs operations style, namespace, response headers
- `rename.*`: Property/entity/enum renaming rules

## Dependencies

- **OpenAPIKit** (CreateAPI fork): OpenAPI 3.0/3.1 parsing
- **swift-argument-parser**: CLI argument handling
- **swift-configuration-parser**: Config file parsing
- **Yams** (CreateAPI fork): YAML parsing
- **GrammaticalNumber**: Pluralization/singularization
- **FileWatcher**: Watch mode (macOS only)

## Code Style

SwiftLint is configured (`.swiftlint.yaml`):
- 4-space indentation
- Multiline arguments on next line
- Force unwrapping detection enabled
- 40+ opt-in rules active

Run SwiftLint before submitting PRs.
