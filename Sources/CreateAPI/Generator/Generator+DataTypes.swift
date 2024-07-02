import Foundation
import OpenAPIKit

extension Generator {
    
    func stringType(for format: JSONTypeFormat.StringFormat) -> TypeIdentifier {
        switch format {
        case .byte:
            return builtInType("Data", format: "byte", overrides: options.dataTypes.string)
        case .binary:
            return builtInType("Data", format: "binary", overrides: options.dataTypes.string)
        case .date where options.useNaiveDate:
            setNaiveDateNeeded()
            return .builtin("NaiveDate")
        case .date:
            return builtInType("String", format: "date", overrides: options.dataTypes.string)
        case .dateTime:
            return builtInType("Date", format: "date-time", overrides: options.dataTypes.string)
        case .other("uri"):
            return builtInType("URL", format: "uri", overrides: options.dataTypes.string)
        case .other("uuid"):
            return builtInType("UUID", format: "uuid", overrides: options.dataTypes.string)
        case .other(let format):
            return builtInType("String", format: format, overrides: options.dataTypes.string)
        case .generic, .password:
            return .builtin("String")
        }
    }
    
    func numberType(for format: JSONTypeFormat.NumberFormat) -> TypeIdentifier {
        switch format {
        case .double:
            return builtInType("Double", format: "double", overrides: options.dataTypes.number)
        case .float:
            return builtInType("Float", format: "float", overrides: options.dataTypes.number)
        case .other(let format):
            return builtInType("Double", format: format, overrides: options.dataTypes.number)
        case .generic:
            return .builtin("Double")
        }
    }
    
    func integerType(for format: JSONTypeFormat.IntegerFormat) -> TypeIdentifier {
        switch format {
        case .int32:
            return builtInType("Int32", format: "int32", overrides: options.dataTypes.integer)
        case .int64:
            return builtInType("Int64", format: "int64", overrides: options.dataTypes.integer)
        case .other(let format):
            return builtInType("Int", format: format, overrides: options.dataTypes.integer)
        case .generic:
            return .builtin("Int")
        }
    }
    
    private func builtInType(_ original: String, format: String, overrides: [String: String]?) -> TypeIdentifier {
        .builtin(overrides?[format] ?? original)
    }
}
