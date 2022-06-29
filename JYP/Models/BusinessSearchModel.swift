//
//  BusinessSearchModel.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import Foundation

struct BusinessSearchModel: Codable {
    
    var total: Int?
    var businesses: [BusinessSearchBusiness]?
    var region: Region?
}

struct BusinessSearchBusiness: Codable, Hashable {
    
    var categories: [BusinessCategory]?
    var coordinates: BusinessCoordinates?
    var display_phone: String?
    var distance: Double?
    var id: String?
    var alias: String?
    var image_url: String?
    var is_closed: Bool?
    var location: BusinessLocation?
    var name: String?
    var phone: String?
    var price: String?
    var rating: Double?
    var review_count: Int?
    var url: String?
    var transactions: [String]?
}

struct BusinessCategory: Codable, Hashable {
    
    var alias: String?
    var title: String?
}

struct BusinessLocation: Codable, Hashable {
    
    var address1: String?
    var address2: String?
    var address3: String?
    
    var city: String?
    var state: String?
    var country: String?
    
    var display_address: [String]?
    var zip_code: String?
}

struct Region: Codable {
    
    var center: BusinessCoordinates?
}

struct BusinessCoordinates: Codable, Hashable {
 
    var longitude: Double?
    var latitude: Double?
}
