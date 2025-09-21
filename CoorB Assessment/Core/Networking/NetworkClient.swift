//
//  NetworkClient.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 19/09/2025.
//

protocol NetworkClient {
    func request<T: Decodable>(_ type: T.Type, endpoint: Endpoint) async throws -> T
}
