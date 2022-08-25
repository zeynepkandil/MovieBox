//
//  Dates.swift
//  MovieBox-MVC
//
//  Created by Kafein on 25.08.2022.
//

import Foundation

struct Dates: Codable {

    var maximum: String
    var minimum: String

    private enum CodingKeys: String, CodingKey {
        case maximum = "maximum"
        case minimum = "minimum"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        maximum = try values.decode(String.self, forKey: .maximum)
        minimum = try values.decode(String.self, forKey: .minimum)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(maximum, forKey: .maximum)
        try container.encode(minimum, forKey: .minimum)
    }

}
