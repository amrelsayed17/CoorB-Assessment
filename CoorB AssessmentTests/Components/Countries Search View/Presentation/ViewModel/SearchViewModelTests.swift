//
//  SearchViewModelTests.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 21/09/2025.
//

import XCTest
@testable import CoorB_Assessment

@MainActor
final class SearchViewModelTests: XCTestCase {

    func test_updateQuery_filtersCaseInsensitive() {
        let searchViewModel = SearchViewModel(allCountries: MockData.sampleList, searchUseCase: SearchCountriesUseCase())
        searchViewModel.updateQuery(text: "egy")
        XCTAssertEqual(searchViewModel.searchResultsList.count, 1)
        XCTAssertEqual(searchViewModel.searchResultsList.first?.alpha2Code, "EG")
    }

    func test_updateQuery_emptyClearsResults() {
        let searchViewModel = SearchViewModel(allCountries: MockData.sampleList, searchUseCase: SearchCountriesUseCase())
        searchViewModel.updateQuery(text: "qa")
        XCTAssertFalse(searchViewModel.searchResultsList.isEmpty)

        searchViewModel.updateQuery(text: "   ")
        XCTAssertTrue(searchViewModel.searchResultsList.isEmpty)
    }

    func test_updateQuery_noMatches_returnsEmpty() {
        let searchViewModel = SearchViewModel(allCountries: MockData.sampleList, searchUseCase: SearchCountriesUseCase())
        searchViewModel.updateQuery(text: "zzz")
        XCTAssertTrue(searchViewModel.searchResultsList.isEmpty)
    }
}
