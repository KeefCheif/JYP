//
//  BusinessReviewModel.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import Foundation

struct BusinessReviewModel: Codable {
    
    var reviews: [ReviewModel]
    var total: Int
    var possible_Languages: [String]?
}

struct ReviewModel: Codable, Hashable {
    
    var id: String
    var rating: Int
    var user: ReviewUser
    var text: String
    var time_created: String?
    var url: String?
}

struct ReviewUser: Codable, Hashable {
    
    var id: String
    var profile_url: String
    var image_url: String?
    var name: String
}
