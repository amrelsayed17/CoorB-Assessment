//
//  Country.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 19/09/2025.
//

import Foundation

public struct Country: Codable, Identifiable, Equatable {
    public let name: String?
    public let alpha2Code: String?
    public let capital: String?
    public let currencies: [Currency]?
    public let latlng: [Double]?
    
    public var id: String {
        alpha2Code ?? ""
    }
    
    public var capitalDisplay: String {
        capital ?? "-"
    }
    
    public var currencyDisplay: String {
        guard let currency = currencies?.first else { return "—" }
        return [currency.name, currency.code, currency.symbol].compactMap { $0 }.joined(separator: "-")
    }
}

public struct Currency: Codable, Equatable {
    public let code: String?
    public let name: String?
    public let symbol: String?
}
