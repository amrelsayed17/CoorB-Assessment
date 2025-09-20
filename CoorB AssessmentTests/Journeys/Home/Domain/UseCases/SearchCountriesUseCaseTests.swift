//
//  SearchCountriesUseCaseTests.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 21/09/2025.
//
import XCTest
@testable import CoorB_Assessment

final class SearchCountriesUseCaseTests: XCTestCase {
    let searchCountriesUseCase = SearchCountriesUseCase()

    func test_search_success_caseInsensitive() {
        let result1 = searchCountriesUseCase.execute(query: "egy", in: MockData.sampleList)
        XCTAssertEqual(result1.count, 1)
    }

    func test_search_emptyQuery_returnsEmpty() {
        let result = searchCountriesUseCase.execute(query: "   ", in: MockData.sampleList)
        XCTAssertTrue(result.isEmpty)
    }

    func test_search_noMatch_returnsEmpty() {
        let result = searchCountriesUseCase.execute(query: "zzz", in: MockData.sampleList)
        XCTAssertTrue(result.isEmpty)
    }
}
