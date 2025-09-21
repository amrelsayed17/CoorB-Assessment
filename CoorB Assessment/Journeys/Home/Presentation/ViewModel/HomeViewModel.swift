//
//  HomeViewModel.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 20/09/2025.
//

import Foundation
import CoreLocation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published private(set) var selectedCountriesList: [Country] = []
    var allCountriesList: [Country] = []
    @Published var errorMessage: String?
    
    private let getAllCountriesUseCase: GetAllCountriesUseCaseContract
    private let locationManager: LocationManagerContract
    private let maxItems = 5
    private let defaultAlpha2 = "US"
    
    init(
        getAllCountriesUseCase: GetAllCountriesUseCaseContract = GetAllCountriesUseCase(),
        locationManager: LocationManagerContract = LocationManager()
    ) {
        self.getAllCountriesUseCase = getAllCountriesUseCase
        self.locationManager = locationManager
    }
    
    func onAppear() async {
        do {
            allCountriesList = try await getAllCountriesUseCase.execute(forceRefresh: false)
            await addInitialCountryByLocationOrDefault()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    private func addInitialCountryByLocationOrDefault() async {
        let status = await locationManager.requestAuthorization()
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            do {
                let placemark = try await locationManager.currentPlacemark()
                let isoCode = placemark.isoCountryCode ?? defaultAlpha2
                if let countryBasedOnLocation = findCountryByAlpha2(code: isoCode) {
                    AddSelectedCountry(country: countryBasedOnLocation); return
                }
            } catch {
                errorMessage = error.localizedDescription
            }
        }
        
        if let defaultCountry = findCountryByAlpha2(code: defaultAlpha2) {
            AddSelectedCountry(country: defaultCountry)
        }
    }
    
    private func findCountryByAlpha2(code: String) -> Country? {
        allCountriesList.first { $0.alpha2Code == code }
    }
    
    func AddSelectedCountry(country: Country) {
        guard selectedCountriesList.count < maxItems else { return }
        guard selectedCountriesList.contains(where: { $0.id == country.id }) == false else { return }
        selectedCountriesList.append(country)
    }
    
    func removeSelectedCountry(at offsets: IndexSet) {
        selectedCountriesList.remove(atOffsets: offsets)
    }
}
