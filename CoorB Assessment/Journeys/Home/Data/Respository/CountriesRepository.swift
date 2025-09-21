//
//  CountriesRepository.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 19/09/2025.
//
import Foundation

final class CountriesRepository: CountriesRepositoryContract {
    private let service: CountriesServiceContract
    private let cacheStore: CountriesCacheStoreContract
    private let timeInterval: TimeInterval
    
    init(service: CountriesServiceContract = CountriesService(),
         cacheStore: CountriesCacheStoreContract = FileCountriesCacheStore(),
         timeInterval: TimeInterval = 24 * 60 * 60) {
        self.service = service
        self.cacheStore = cacheStore
        self.timeInterval = timeInterval
    }

    func fetchAllCountries(forceRefresh: Bool) async throws -> [Country] {
        if !forceRefresh,
           let updated = await cacheStore.lastUpdated(),
           Date().timeIntervalSince(updated) < timeInterval,
           let cachedCountriesData = try? await cacheStore.load(),
           !cachedCountriesData.isEmpty {
            return cachedCountriesData
        }

        let freshCountriesData = try await service.fetchAll()
        try? await cacheStore.save(list: freshCountriesData)
        return freshCountriesData
    }
}
