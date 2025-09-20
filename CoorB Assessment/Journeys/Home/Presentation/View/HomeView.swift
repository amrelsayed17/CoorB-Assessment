//
//  HomeView.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 20/09/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var showSearch = false
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.selectedCountriesList.isEmpty {
                    noCountriesView
                } else {
                    countryList
                }
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    toolbarContent
                }
            }
            .task {
                await viewModel.onAppear()
            }
            .sheet(isPresented: $showSearch) {
                SearchView(allCountries: viewModel.allCountriesList,
                           onPick: { country in
                    viewModel.AddSelectedCountry(country: country)
                    showSearch = false
                })
            }
        }
    }
    
    var noCountriesView: some View {
        Text("No countries yet")
    }
    
    var countryList: some View {
        List {
            ForEach(viewModel.selectedCountriesList) { country in
                VStack {
                    Text(country.name ?? "")
                    Text(country.capitalDisplay)
                }
            }
            .onDelete(perform: viewModel.removeSelectedCountry)
        }
        .listStyle(.insetGrouped)
    }
    
    var toolbarContent: some View {
        Button {
            showSearch = true
        } label: {
            Image(systemName: "plus")
        }.disabled(viewModel.selectedCountriesList.count >= 5)
    }
}
