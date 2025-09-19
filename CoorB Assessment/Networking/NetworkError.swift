//
//  NetworkError.swift
//  CoorB Assessment
//
//  Created by Amr ElSayed on 19/09/2025.
//
import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case badStatus(Int, Data?)
    case decoding(Error)
    case transport(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .badStatus(let code, _): return "HTTP \(code)"
        case .decoding(let e): return "Decoding error: \(e.localizedDescription)"
        case .transport(let e): return "Network error: \(e.localizedDescription)"
        }
    }
}
