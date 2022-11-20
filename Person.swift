//
//  Person.swift
//  Challenge3
//
//  Created by paul locksley on 22/10/2022.
//

import Foundation
import SwiftUI

struct Person: Identifiable, Codable, Hashable, Comparable {
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.name < rhs.name
    }
    
    var picture: Data?
    var name: String
    var desc: String
    var id: UUID

    func uiPicture() -> UIImage? { //this is not a good way to do this.
        if let picture {
            return UIImage(data: picture)
        }
        return nil
    }

    public init (Picture: UIImage? ,name: String, desc: String){
        if let Picture {
            picture = Picture.pngData()
        }
        id = UUID()
        self.name = name
        self.desc = desc

    }
}
//    enum CodingKeys: CodingKey {
//        case picture, name, desc, id
//    }
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        picture = try container.decode(Image(uiImage: UIImage(data: <#T##Data#>)), forKey: .picture)
//        name = try container.decode(String.self, forKey: .name)
//        desc = try container.decode(String.self, forKey: .desc)
//        id = try container.decode(UUID.self, forKey: .id)
//
//    }
