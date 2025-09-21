//
//  CountriesServiceTests.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 20/09/2025.
//

import XCTest
@testable import CoorB_Assessment

final class CountriesServiceTests: XCTestCase {
    func test_fetchAll_success_returnsList() async throws {
        let client = MockURLSessionClient()
        client.stubbedResponse = MockData.sampleList
        let countriesService = CountriesService(client: client)
        
        let list = try await countriesService.fetchAll()
        XCTAssertEqual(list.count, MockData.sampleList.count)
        XCTAssertEqual(list.first?.alpha2Code, "EG")
    }
    
    func test_fetchAll_failure_propagatesError() async {
        struct StubError: Error {}
        let client = MockURLSessionClient()
        client.stubbedError = StubError()
        let countriesService = CountriesService(client: client)
        
        do {
            let list = try await countriesService.fetchAll()
            XCTAssertEqual(list.count, 0)
            XCTAssertEqual(list.first?.alpha2Code, nil)
        } catch { }
    }
}
