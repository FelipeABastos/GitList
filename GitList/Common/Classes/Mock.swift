//
//  Mock.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 29/05/23.
//

import Foundation

final class Mock {
    
    let fileManager = FileManager()
    
    static let shared = Mock()
    
    private init() {}
    
    func load(type: MockType) -> Data? {
        var data: Data? = nil
        if let path = Bundle.main.path(forResource: type.rawValue, ofType: "json"),
            fileManager.fileExists(atPath: path) {
            data = fileManager.contents(atPath: path)
            self.log(data, type.rawValue)
        }
        return data
    }
    
    private func log(_ data: Data?, _ mock: String) {
        if let aux = data,
            let response = String(data: aux, encoding: String.Encoding.utf8) {
            debugPrint("\n==================== Loading Mock: \(mock) ====================\n")
            debugPrint(response)
            debugPrint("\n===============================================================\n")
        }
    }
}
