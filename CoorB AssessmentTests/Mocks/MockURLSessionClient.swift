//
//  MockURLSessionClient.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 20/09/2025.
//

import Foundation
@testable import CoorB_Assessment

final class MockURLSessionClient: NetworkClient {
    var stubbedResponse: Any?
    var stubbedError: Error?

    func request<T: Decodable>(_ type: T.Type, endpoint: Endpoint) async throws -> T {
        if let e = stubbedError { throw e }
        guard let value = stubbedResponse as? T else {
            fatalError("Stub type mismatch. Expected \(T.self)")
        }
        return value
    }
}
