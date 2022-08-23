//
//  NetworkManager.swift
//  MovieBox-MVC
//
//  Created by Kafein on 17.08.2022.
//

import Foundation
import Moya
import Alamofire

protocol NetworkDelegate {
    var provider : MoyaProvider<API> {get}
    
    func createRequestToken(completion: @escaping (Result<RequestTokenResponse, NetworkError>) -> ())
    
    func searchMovie(name: String, completion: @escaping (Result<SearchMovieResponse, NetworkError>) -> ())
    
}

final class NetworkManager : NetworkDelegate {
    
    var provider = MoyaProvider<API>(
        
        //Disable SSL
        session: Session.init(configuration: URLSessionConfiguration.af.default,
                              serverTrustManager: ServerTrustManager(evaluators: [ "api.themoviedb.org" : DisabledTrustEvaluator()])) ,
        plugins: [NetworkLoggerPlugin()]
        
    )
    
    func createRequestToken(completion: @escaping (Result<RequestTokenResponse, NetworkError>) -> ()) {
        request(target: .createRequestToken, completion: completion)
    }
    
    func searchMovie(name: String, completion: @escaping (Result<SearchMovieResponse, NetworkError>) -> ()) {
        request(target: .searchMovie(name: name), completion: completion)
    }
    
}



private extension NetworkManager {
    private func request<T: Decodable>(target: API, completion: @escaping (Result<T, NetworkError>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(NetworkError.serializationError(internal: error)))
                }
            case let .failure(error):
                completion(.failure(NetworkError.networkError(internal: error)))
            }
        }
    }
}
