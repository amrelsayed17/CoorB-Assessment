//
//  CountriesServiceContract.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 19/09/2025.
//

protocol CountriesServiceContract {
    func fetchAll() async throws -> [Country]
}
