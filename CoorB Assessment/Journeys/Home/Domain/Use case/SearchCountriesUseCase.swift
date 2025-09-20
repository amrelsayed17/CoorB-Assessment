//
//  SearchCountriesUseCase.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 19/09/2025.
//

import Foundation

struct SearchCountriesUseCase: SearchCountriesUseCaseContract {
    func execute(query: String, in list: [Country]) -> [Country] {
        let q = query.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard !q.isEmpty else { return [] }
        return list.filter { $0.name?.lowercased().contains(q) ?? false }
    }
}
