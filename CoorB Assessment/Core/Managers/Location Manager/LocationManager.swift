//
//  LocationManager.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 19/09/2025.
//

import CoreLocation

final class LocationManager: NSObject, LocationManagerContract, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    private var authContinuation: CheckedContinuation<CLAuthorizationStatus, Never>?
    private var locationContinuation: CheckedContinuation<CLPlacemark, Error>?

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestAuthorization() async -> CLAuthorizationStatus {
        let status = manager.authorizationStatus
        guard status == .notDetermined else { return status }
        return await withCheckedContinuation { cont in
            authContinuation = cont
            manager.requestWhenInUseAuthorization()
        }
    }

    func currentPlacemark() async throws -> CLPlacemark {
        if CLLocationManager.locationServicesEnabled() == false {
            throw CLError(.denied)
        }
        manager.startUpdatingLocation()
        return try await withCheckedThrowingContinuation { cont in
            locationContinuation = cont
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if let cont = authContinuation {
            authContinuation = nil
            cont.resume(returning: manager.authorizationStatus)
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let loc = locations.last else { return }
        manager.stopUpdatingLocation()
        CLGeocoder().reverseGeocodeLocation(loc) { [weak self] placemarks, error in
            guard let self else { return }
            if let error { self.locationContinuation?.resume(throwing: error); self.locationContinuation = nil; return }
            if let pm = placemarks?.first {
                self.locationContinuation?.resume(returning: pm)
                self.locationContinuation = nil
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationContinuation?.resume(throwing: error)
        locationContinuation = nil
    }
}
