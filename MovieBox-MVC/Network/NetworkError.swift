//
//  NetworkError.swift
//  MovieBox-MVC
//
//  Created by Kafein on 17.08.2022.
//

import Foundation

public enum NetworkError: Error {
    case serializationError(internal: Error)
    case networkError(internal: Error)
}
