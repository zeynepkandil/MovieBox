//
//  SearchMovieResponse.swift
//  MovieBox-MVC
//
//  Created by Kafein on 23.08.2022.
//

import Foundation
//
//struct SearchMovieResponse: Codable {
//
//    let page: Int?
//    let results: [MovieResult]?
//    let totalPages: Int?
//    let totalResults: Int?
//    let statusCode: Int?
//    let statusMessage: String?
//
//
//    private enum CodingKeys: String, CodingKey {
//        case page = "page"
//        case results = "results"
//        case totalPages = "total_pages"
//        case totalResults = "total_results"
//        case statusCode = "status_code"
//        case statusMessage = "status_message"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        page = try values.decodeIfPresent(Int.self, forKey: .page)
//        results = try values.decodeIfPresent([MovieResult].self, forKey: .results)
//        totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
//        totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
//        statusCode = try values.decodeIfPresent(Int.self, forKey: .statusCode)
//        statusMessage = try values.decodeIfPresent(String.self, forKey: .statusMessage)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encodeIfPresent(page, forKey: .page)
//        try container.encodeIfPresent(results, forKey: .results)
//        try container.encodeIfPresent(totalPages, forKey: .totalPages)
//        try container.encodeIfPresent(totalResults, forKey: .totalResults)
//        try container.encodeIfPresent(statusCode, forKey: .statusCode)
//        try container.encodeIfPresent(statusMessage, forKey: .statusMessage)
//    }
//
//}

struct SearchMovieResponse: Codable {

    var page: Int
    var results: [Movie]
    var totalPages: Int
    var totalResults: Int

    private enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = try values.decode(Int.self, forKey: .page)
        results = try values.decode([Movie].self, forKey: .results)
        totalPages = try values.decode(Int.self, forKey: .totalPages)
        totalResults = try values.decode(Int.self, forKey: .totalResults)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(page, forKey: .page)
        try container.encode(results, forKey: .results)
        try container.encode(totalPages, forKey: .totalPages)
        try container.encode(totalResults, forKey: .totalResults)
    }

}
