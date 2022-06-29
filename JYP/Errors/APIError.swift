//
//  APIError.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import Foundation

enum APIError: Error, LocalizedError {
    
    case apiKeyMissing
    case businessReviewsRequestFailed
    case businessSearchRequestFailed
    
    var errorDescription: String? {
        switch self {
        case .apiKeyMissing:
            return NSLocalizedString("API Key could not be found. Please go to the app's settings to set the 'Yelp Key' value then retry.", comment: "")
        case .businessReviewsRequestFailed:
            return NSLocalizedString("Failed to get reviews", comment: "")
        case .businessSearchRequestFailed:
            return NSLocalizedString("Failed to get businesses.", comment: "")
        }
    }
}
