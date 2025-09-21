//
//  CountriesCacheEnvelope.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 21/09/2025.
//

import Foundation

struct CountriesCacheEnvelope: Codable {
    let items: [Country]
    let savedAt: Date
}
