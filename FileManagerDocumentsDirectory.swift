//
//  FileManagerDocumentsDirectory.swift
//  Challenge3
//
//  Created by paul locksley on 22/10/2022.
//

import Foundation
extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
