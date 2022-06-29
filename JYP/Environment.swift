//
//  Environment.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import Foundation

public enum Defaults {
    
    // - - - - - PLIST KEYS - - - - - //
    enum Keys {
        static let apiKey = "API_KEY"
        static let baseURL = "BASE_API_URL"
    }
    
    // - - - - - PLIST - - - - - //
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist not found")
        }
        
        return dict
    }()
    
    // - - - - - BASE URL - - - - - //
    static let BASE_URL: String = {
        guard let baseURLString = Defaults.infoDictionary[Keys.baseURL] as? String else {
            fatalError("Base URL not in plist")
        }
        
        return baseURLString
    }()
    
    // - - - - - API KEY - - - - - //
    static let API_KEY: String = {
        guard let apiKeyString = Defaults.infoDictionary[Keys.apiKey] as? String else {
            fatalError("API Key not in plist")
        }
        
        return apiKeyString
    }()
}
