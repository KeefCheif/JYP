//
//  LocationGlobals.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import Foundation

struct LocationGlobals {
    
}

enum Locations {
    case Atlanta, Chicago, Denver, New_York, San_Diego, San_Francisco, current(Double, Double)
    
    public var lat: Double {
        switch self {
        case .Atlanta:
            return 33.753746
        case .Chicago:
            return 41.881832
        case .Denver:
            return 39.742043
        case .New_York:
            return 40.730610
        case .San_Diego:
            return 32.715736
        case .San_Francisco:
            return 37.773972
        case .current(let lat, _):
            return lat
        }
    }
    
    public var long: Double {
        switch self {
        case .Atlanta:
            return -84.386330
        case .Chicago:
            return -87.623177
        case .Denver:
            return -104.991531
        case .New_York:
            return -73.935242
        case .San_Diego:
            return -117.161087
        case .San_Francisco:
            return -122.431297
        case .current(_, let long):
            return long
        }
    }
    
    public var name: String {
        switch self {
        case .Atlanta:
            return "Atlanta"
        case .Chicago:
            return "Chicago"
        case .Denver:
            return "Denver"
        case .New_York:
            return "New York"
        case .San_Diego:
            return "San Diego"
        case .San_Francisco:
            return "San Francisco"
        case .current(_, _):
            return "current"
        }
    }
}
