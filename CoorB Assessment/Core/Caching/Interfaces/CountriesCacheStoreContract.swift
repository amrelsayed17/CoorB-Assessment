//
//  CountriesCacheStoreContract.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 21/09/2025.
//
import Foundation

protocol CountriesCacheStoreContract {
    func load() async throws -> [Country]
    func save(list: [Country]) async throws
    func lastUpdated() async -> Date?
    func clear() async throws
}
