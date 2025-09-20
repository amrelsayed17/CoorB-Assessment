//
//  LocationManagerContract.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 19/09/2025.
//

import CoreLocation

protocol LocationManagerContract {
    func requestAuthorization() async -> CLAuthorizationStatus
    func currentPlacemark() async throws -> CLPlacemark
}
