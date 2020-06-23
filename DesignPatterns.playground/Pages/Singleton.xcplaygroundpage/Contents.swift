
import Foundation
typealias File = Data

class Database {
    
    static var sharedInstance: Database = .init()
    
    private init() {}

    func files(for string: String) -> [File] {
        return [Data(), Data()]
    }
}

struct SearchService {
    
    let database: Database
    
    func searchFiles(string: String) -> [File] {
        database.files(for: string)
    }
}

let service = SearchService(database: Database.sharedInstance)

print(service.searchFiles(string: "pizza"))
