//
//  NetworkConfig.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 19/09/2025.
//
import Foundation

struct NetworkConfig {
    let baseURL: URL
    var defaultHeaders: [String: String] = ["Accept": "application/json"]
    var timeout: TimeInterval = 60
}
