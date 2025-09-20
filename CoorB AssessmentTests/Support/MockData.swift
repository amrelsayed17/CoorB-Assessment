//
//  MockData.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 20/09/2025.
//

import Foundation
@testable import CoorB_Assessment

enum MockData {
    static let eg = Country(name: "Egypt", alpha2Code: "EG", capital: "Cairo", currencies: [.init(code: "EGP", name: "Egyptian pound", symbol: "£")], latlng: nil)

    static let ae = Country(name: "United Arab Emirates", alpha2Code: "AE", capital: "Abu Dhabi", currencies: nil, latlng: nil)

    static let sa = Country(name: "Saudi Arabia", alpha2Code: "SA", capital: "Riyadh", currencies: nil, latlng: nil)

    static let qa = Country(name: "Qatar", alpha2Code: "QA", capital: "Doha", currencies: nil, latlng: nil)

    static let jo = Country(name: "Jordan", alpha2Code: "JO", capital: "Amman", currencies: nil, latlng: nil)

    static let kw = Country(name: "Kuwait", alpha2Code: "KW", capital: "Kuwait City", currencies: nil, latlng: nil)

    static let sampleList: [Country] = [eg, ae, sa, qa, jo, kw]
}
