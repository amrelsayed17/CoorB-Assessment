//
//  SearchCountriesUseCaseContract.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 19/09/2025.
//

import Foundation

protocol SearchCountriesUseCaseContract {
    func execute(query: String, in list: [Country]) -> [Country]
}
