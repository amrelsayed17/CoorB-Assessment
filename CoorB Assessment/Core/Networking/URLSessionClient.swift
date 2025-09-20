//
//  URLSessionClient.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 19/09/2025.
//

import Foundation

final class URLSessionClient: NetworkClient {
    private let config: NetworkConfig
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(config: NetworkConfig,
         session: URLSession = .shared,
         decoder: JSONDecoder = .init()) {
        self.config = config
        self.session = session
        self.decoder = decoder
    }
    
    func request<T: Decodable>(_ type: T.Type, endpoint: Endpoint) async throws -> T {
        guard var comps = URLComponents(url: config.baseURL.appendingPathComponent(endpoint.path),
                                        resolvingAgainstBaseURL: false) else {
            throw NetworkError.invalidURL
        }
        comps.queryItems = endpoint.query
        
        guard let url = comps.url else { throw NetworkError.invalidURL }
        var req = URLRequest(url: url, timeoutInterval: config.timeout)
        req.httpMethod = endpoint.method.rawValue
        config.defaultHeaders.forEach { req.setValue($1, forHTTPHeaderField: $0) }
        endpoint.headers?.forEach { req.setValue($1, forHTTPHeaderField: $0) }
        
        do {
            let (data, resp) = try await session.data(for: req)
            guard let http = resp as? HTTPURLResponse else { throw NetworkError.transport(URLError(.badServerResponse)) }
            guard 200..<300 ~= http.statusCode else { throw NetworkError.badStatus(http.statusCode, data) }
            do { return try decoder.decode(T.self, from: data) }
            catch { throw NetworkError.decoding(error) }
        } catch { throw NetworkError.transport(error) }
    }
}
