//
//  BusinessReviewsViewModel.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import Foundation

class BusinessReviewsViewModel: ObservableObject {
    
    @Published var isLoading: Bool = true
    @Published var reviews: BusinessReviewModel?
    
    @Published var api_error: APIError?
    
    private let apiManager: APIManager = APIManager()
    
    init(id: String) {
        
        self.apiManager.getBusinessReview(id: id) { [unowned self] (model, error) in
            DispatchQueue.main.async {
                self.api_error = error
                self.reviews = model
                self.isLoading = false
            }
        }
    }
}
