//
//  CountriesEndpoint.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 19/09/2025.
//

import Foundation

enum CountriesEndpoint: Endpoint {
    case all(fields: String)

    var path: String {
        "all"
    }
    
    var method: HTTPMethod {
        .GET
    }
    
    var query: [URLQueryItem]? {
        switch self {
        case .all(let fields):
            return [.init(name: "fields", value: fields)]
        }
    }
    var headers: [String: String]? { nil }
}
