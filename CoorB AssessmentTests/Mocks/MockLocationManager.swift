//
//  MockLocationManager.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 20/09/2025.
//

import CoreLocation
import MapKit

@testable import CoorB_Assessment

final class MockLocationManager: LocationManagerContract {
    var status: CLAuthorizationStatus = .denied
    var isoCode: String? = nil

    func requestAuthorization() async -> CLAuthorizationStatus { status }

    func currentPlacemark() async throws -> CLPlacemark {
        let dict: [String: Any]? = isoCode.map { ["CountryCode": $0, "Country": ""] }
        let mk = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0),
                             addressDictionary: dict)
        return mk
    }
}
