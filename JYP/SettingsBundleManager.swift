//
//  BundleManager.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import Foundation

let userDefaults = UserDefaults.standard

    func configureSettingsBundle() {
        
        guard let settingsBundle = Bundle.main.url(forResource: "Settings", withExtension:"bundle") else {
            print("Settings.bundle not found")
            return;
        }
        
        guard let settings = NSDictionary(contentsOf: settingsBundle.appendingPathComponent("Root.plist")) else {
            print("Root.plist not found in settings bundle")
            return
        }
        
        guard let preferences = settings.object(forKey: "PreferenceSpecifiers") as? [[String: AnyObject]] else {
            print("Root.plist has invalid format")
            return
        }
        
        var defaultsToRegister = [String: AnyObject]()
        for var pref in preferences {
            if let key = pref["Key"] as? String, let val = pref["DefaultValue"] {
                defaultsToRegister[key] = val
            }
        }
        userDefaults.register(defaults: defaultsToRegister)
    }
