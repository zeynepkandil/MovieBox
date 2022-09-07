//
//  UpcomingMovieResponse.swift
//  MovieBox-MVC
//
//  Created by Kafein on 25.08.2022.
//

import Foundation

struct UpcomingMoviesResponse: Codable {

    var dates: Dates?
    var page: Int?
    var results: [Movie]?
    var totalPages: Int?
    var totalResults: Int?

    private enum CodingKeys: String, CodingKey {
        case dates = "dates"
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dates = try values.decode(Dates.self, forKey: .dates)
        page = try values.decode(Int.self, forKey: .page)
        results = try values.decode([Movie].self, forKey: .results)
        totalPages = try values.decode(Int.self, forKey: .totalPages)
        totalResults = try values.decode(Int.self, forKey: .totalResults)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(dates, forKey: .dates)
        try container.encode(page, forKey: .page)
        try container.encode(results, forKey: .results)
        try container.encode(totalPages, forKey: .totalPages)
        try container.encode(totalResults, forKey: .totalResults)
    }

}
