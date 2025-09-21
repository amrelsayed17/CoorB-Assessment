//
//  HomeViewModelTests.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 21/09/2025.
//
import XCTest
@testable import CoorB_Assessment

@MainActor
final class HomeViewModelTests: XCTestCase {

    func test_onAppear_success_deniedAddsDefault() async {
        let usecase = MockGetAllCountriesUseCase()
        let locationManager = MockLocationManager()
        locationManager.status = .denied

        let homeViewModel = HomeViewModel(getAllCountriesUseCase: usecase, locationManager: locationManager)
        await homeViewModel.onAppear()
        XCTAssertEqual(homeViewModel.selectedCountriesList.first?.alpha2Code, "US")
    }

    func test_onAppear_success_authorizedAddsDetected() async {
        let usecase = MockGetAllCountriesUseCase()
        let locationManager = MockLocationManager()
        locationManager.status = .authorizedWhenInUse
        locationManager.isoCode = "EG"

        let homeViewModel = HomeViewModel(getAllCountriesUseCase: usecase, locationManager: locationManager)
        await homeViewModel.onAppear()
        
        XCTAssertEqual(homeViewModel.selectedCountriesList.first?.alpha2Code, "EG")
    }

    func test_add_respectsMaxFive() async {
        let usecase = MockGetAllCountriesUseCase()
        let locationManager = MockLocationManager()

        let homeViewModel = HomeViewModel(getAllCountriesUseCase: usecase, locationManager: locationManager)
        await homeViewModel.onAppear()

        for country in MockData.sampleList where country.alpha2Code != homeViewModel.selectedCountriesList.first?.alpha2Code {
            homeViewModel.AddSelectedCountry(country: country)
        }
        XCTAssertLessThanOrEqual(homeViewModel.selectedCountriesList.count, 5)
    }
}
