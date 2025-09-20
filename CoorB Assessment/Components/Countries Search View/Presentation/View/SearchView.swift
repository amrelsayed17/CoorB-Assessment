//
//  SearchView.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 20/09/2025.
//
import SwiftUI

struct SearchView: View {
    
    let onPick: (Country) -> Void
    
    @StateObject private var viewModel: SearchViewModel
    @Environment(\.dismiss) private var dismiss
    
    init(allCountries: [Country],
         onPick: @escaping (Country) -> Void) {
        self.onPick = onPick
        _viewModel = StateObject(wrappedValue: .init(allCountries: allCountries))
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.searchResultsList) { country in
                countriesListItem(country: country)
            }
            .searchable(text: Binding(
                get: {
                    viewModel.query
                },
                set: {
                    viewModel.query = $0
                    viewModel.updateQuery(text: $0)
                }
            ))
            .navigationTitle("Add Country")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    toolbarContent
                }
            }
        }
    }
    
    func countriesListItem(country: Country) -> some View {
        Button {
            onPick(country)
        } label: {
            HStack {
                Text(country.name ?? "")
                Spacer()
                Text(country.capitalDisplay)
            }
        }
    }
    
    var toolbarContent: some View {
        Button("Close") {
            dismiss()
        }
    }
}
