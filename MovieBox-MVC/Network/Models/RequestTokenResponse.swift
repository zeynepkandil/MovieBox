//
//  GuestSessionResponse.swift
//  MovieBox-MVC
//
//  Created by Kafein on 17.08.2022.
//

import Foundation

struct RequestTokenResponse: Codable {

    let success: Bool?
    let expiresAt: String?
    let requestToken: String?
    let statusCode: Int?
    let statusMessage: String?

    private enum CodingKeys: String, CodingKey {
        case success = "success"
        case expiresAt = "expires_at"
        case requestToken = "request_token"
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        expiresAt = try values.decodeIfPresent(String.self, forKey: .expiresAt)
        requestToken = try values.decodeIfPresent(String.self, forKey: .requestToken)
        statusCode = try values.decodeIfPresent(Int.self, forKey: .statusCode)
        statusMessage = try values.decodeIfPresent(String.self, forKey: .statusMessage)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(success, forKey: .success)
        try container.encodeIfPresent(expiresAt, forKey: .expiresAt)
        try container.encodeIfPresent(requestToken, forKey: .requestToken)
        try container.encodeIfPresent(statusCode, forKey: .statusCode)
        try container.encodeIfPresent(statusMessage, forKey: .statusMessage)
    }
}
