//
//  CountriesRepositoryTests.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 21/09/2025.
//
import XCTest
@testable import CoorB_Assessment

final class CountriesRepositoryTests: XCTestCase {
    func test_fetchAll_success_passThrough() async throws {
        let countriesService = MockCountriesService()
        countriesService.stub = MockData.sampleList
        let countriesRepository = CountriesRepository(service: countriesService)
        
        let countriesList = try await countriesRepository.fetchAllCountries(forceRefresh: false)
        XCTAssertEqual(countriesList.count, MockData.sampleList.count)
    }

    func test_fetchAll_failure_propagates() async throws {
        let countriesService = MockCountriesService()
        countriesService.stub = MockData.emptyList
        let countriesRepository = CountriesRepository(service: countriesService)
        
        let countriesList = try await countriesRepository.fetchAllCountries(forceRefresh: false)
        XCTAssertEqual(countriesList.count, 0)
        XCTAssertEqual(countriesList.first?.alpha2Code, nil)
    }
}
