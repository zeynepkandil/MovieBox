//
//  API.swift
//  MovieBox-MVC
//
//  Created by Kafein on 17.08.2022.
//

import Moya

enum API {
    case createRequestToken
    case searchMovie(name: String)
}

extension API : TargetType {
    var baseURL: URL {
        switch self {
        case .searchMovie(let name):
            return URL(string: String(format: URLConstants.baseUrl, "search/movie?api_key=\(URLConstants.apiKey)&query=\(name)"))!
        default:
            return URL(string: String(format: URLConstants.baseUrl, "authentication/token/new?api_key=\(URLConstants.apiKey)"))!
        }
    }
    
    var path: String {
        switch self {
        case .createRequestToken:
            return ""
        case .searchMovie:
            return ""
        }
    }
    
    var method: Method {
        switch self {
        case .createRequestToken:
            return .get
        case .searchMovie:
            return .get
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        default :
            return [:]
        }
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .createRequestToken:
            return .requestPlain
        case .searchMovie:
            return .requestPlain
                //.requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        let header: [String : String] = [
            "Content-Type" : "application/json"
        ]
        return header
    }
    
    
}
