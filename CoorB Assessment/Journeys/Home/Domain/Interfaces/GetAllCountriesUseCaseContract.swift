//
//  GetAllCountriesUseCaseContract.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 19/09/2025.
//

import Foundation

protocol GetAllCountriesUseCaseContract {
    func execute(forceRefresh: Bool) async throws -> [Country]
}
