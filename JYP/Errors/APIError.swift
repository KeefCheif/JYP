//
//  APIError.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import Foundation

enum APIError: Error, LocalizedError {
    
    case businessReviewsRequestFailed
    case businessSearchRequestFailed
    
    var errorDescription: String? {
        switch self {
        case .businessReviewsRequestFailed:
            return NSLocalizedString("Failed to get reviews", comment: "")
        case .businessSearchRequestFailed:
            return NSLocalizedString("Failed to get businesses.", comment: "")
        }
    }
}
