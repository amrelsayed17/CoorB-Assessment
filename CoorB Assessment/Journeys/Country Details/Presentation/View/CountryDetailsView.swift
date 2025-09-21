//
//  CountryDetailsView.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 20/09/2025.
//
import SwiftUI

struct CountryDetailsView: View {
    let country: Country
    var body: some View {
        Form {
            Section("Overview") {
                LabeledContent("Name", value: country.name ?? "")
                LabeledContent("Capital", value: country.capitalDisplay)
                LabeledContent("Currency", value: country.currencyDisplay)
            }
        }
        .navigationTitle(country.name ?? "")
    }
}
