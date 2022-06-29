//
//  LocationError.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import Foundation

enum LocationError: Error, LocalizedError {
    
    case failedCurrentLocation
    
    var errorDescription: String? {
        switch self {
        case .failedCurrentLocation:
            return NSLocalizedString("Failed to get current location.", comment: "")
        }
    }
}
