//
//  SearchViewModel.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 20/09/2025.
//
import Foundation

@MainActor
final class SearchViewModel: ObservableObject {
    @Published var query: String = ""
    @Published private(set) var searchResultsList: [Country] = []
    
    private let searchUseCase: SearchCountriesUseCaseContract
    private let allCountries: [Country]
    
    init(allCountries: [Country],
         searchUseCase: SearchCountriesUseCaseContract = SearchCountriesUseCase() ) {
        self.allCountries = allCountries
        self.searchUseCase = searchUseCase
        self.searchResultsList = allCountries
    }
    
    func updateQuery(text: String) {
        searchResultsList = searchUseCase.execute(query: text, in: allCountries)
    }
}
