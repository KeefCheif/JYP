//
//  BusinessListViewModel.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import Foundation

class BusinessListViewModel: ObservableObject {
    
    @Published var isLoading: Bool
    
    @Published var businesses_model: BusinessSearchModel = BusinessSearchModel()
    
    @Published var liked: [String: Any] = UserDefaults.standard.dictionary(forKey: "liked") ?? [String: Any]() {
        didSet {
            UserDefaults.standard.set(liked, forKey: "liked")
        }
    }
    
    @Published var api_error: APIError?
    
    private let apiManager: APIManager = APIManager()
    
    init(latitude: Double, longitude: Double) {
        
        self.isLoading = true
        
        self.apiManager.getBusinesses(latitude: latitude, longitude: longitude) { [unowned self] (model, error) in
            
            DispatchQueue.main.async {      // Only update published variables on the main thread
                if let error = error {
                    self.api_error = error
                } else if let model = model {
                    
                    self.businesses_model = model
                }
                
                self.isLoading = false
            }
        }
    }
}
