//
//  CountriesService.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 19/09/2025.
//
import Foundation

struct CountriesService: CountriesServiceContract {
    private let client: NetworkClient
    init(client: NetworkClient = URLSessionClient(config: .init(baseURL: URL(string: Constants.baseURL.rawValue)!))) { self.client = client }

    func fetchAll() async throws -> [Country] {
        let fields = "name,alpha3Code,capital,currencies,latlng"
        return try await client.request(
            [Country].self,
            endpoint: CountriesEndpoint.all(fields: fields)
        )
    }
}
