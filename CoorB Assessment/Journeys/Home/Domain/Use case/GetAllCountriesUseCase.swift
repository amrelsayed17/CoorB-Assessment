//
//  GetAllCountriesUseCase.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 19/09/2025.
//

struct GetAllCountriesUseCase: GetAllCountriesUseCaseContract {
    private let repo: CountriesRepositoryContract
    init(repo: CountriesRepositoryContract = CountriesRepository()) {
        self.repo = repo
    }
    func execute(forceRefresh: Bool) async throws -> [Country] {
        try await repo.fetchAllCountries(forceRefresh: forceRefresh)
    }
}
