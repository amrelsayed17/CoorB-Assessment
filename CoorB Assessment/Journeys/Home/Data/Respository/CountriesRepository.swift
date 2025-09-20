//
//  CountriesRepository.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 19/09/2025.
//
import Foundation

final class CountriesRepository: CountriesRepositoryContract {
    private let service: CountriesServiceContract

    init(service: CountriesServiceContract = CountriesService()) {
        self.service = service
    }

    func fetchAllCountries(forceRefresh: Bool) async throws -> [Country] {
        return try await service.fetchAll()
    }

    func cachedCountries() async -> [Country] {
        return []
    }
}
