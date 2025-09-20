//
//  CountryTests.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 20/09/2025.
//

import XCTest
@testable import CoorB_Assessment

final class CountryModelTests: XCTestCase {
    func test_currencyDisplay_format() {
        let egCountry = MockData.eg
        XCTAssertEqual(egCountry.currencyDisplay, "Egyptian pound-EGP-£")
    }

    func test_currencyDisplay_dashWhenMissing() {
        let saCountry = MockData.sa
        XCTAssertEqual(saCountry.currencyDisplay, "—")
    }
}
