//
//  MockGetAllCountriesUseCase.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 21/09/2025.
//
import Foundation
@testable import CoorB_Assessment

final class MockGetAllCountriesUseCase: GetAllCountriesUseCaseContract {
    func execute(forceRefresh: Bool) async throws -> [Country] {
        return MockData.sampleList
    }
}
