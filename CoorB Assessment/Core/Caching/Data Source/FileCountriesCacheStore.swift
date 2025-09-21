//
//  FileCountriesCacheStore.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 21/09/2025.
//

import Foundation

final class FileCountriesCacheStore: CountriesCacheStoreContract {
    private let fileURL: URL
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    init(filename: String = "CoorB_countries_cache.json") {
        let dir = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        self.fileURL = dir.appendingPathComponent(filename)
    }

    func load() async throws -> [Country] {
        let data = try Data(contentsOf: fileURL)
        let env = try decoder.decode(CountriesCacheEnvelope.self, from: data)
        return env.items
    }

    func save(list: [Country]) async throws {
        let env = CountriesCacheEnvelope(items: list, savedAt: Date())
        let data = try encoder.encode(env)
        try data.write(to: fileURL, options: .atomic)
    }

    func lastUpdated() async -> Date? {
        guard let data = try? Data(contentsOf: fileURL),
              let env = try? decoder.decode(CountriesCacheEnvelope.self, from: data) else {
            return nil
        }
        return env.savedAt
    }

    func clear() async throws {
        if FileManager.default.fileExists(atPath: fileURL.path) {
            try FileManager.default.removeItem(at: fileURL)
        }
    }
}
