//
//  MockCountriesService.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 20/09/2025.
//

import Foundation
@testable import CoorB_Assessment

final class MockCountriesService: CountriesServiceContract {
    var stub: [Country] = []
    
    func fetchAll() async throws -> [Country] {
        stub
    }
}
