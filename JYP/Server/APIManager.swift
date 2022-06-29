//
//  APIManager.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import Foundation

struct APIManager {
    
    public func getBusinesses(latitude: Double, longitude: Double, completion: @escaping (BusinessSearchModel?, APIError?) -> Void) {
        
        // Prepare URL & parameters for request to Yelp API
        guard let url = URL(string: String(format: "\(Defaults.BASE_URL)/search?latitude=\(latitude)&longitude=\(longitude)&radius=16000&limit=10")) else {
            completion(nil, .businessSearchRequestFailed)
            return
        }
        
        // Initialize GET Request with url, headers, & parameters
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(Defaults.API_KEY)", forHTTPHeaderField: "Authorization")
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        // Send GET Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil, .businessSearchRequestFailed)
            } else if let data = data {
                
                // Validate Server Response
                guard let response = response as? HTTPURLResponse else {
                    completion(nil, .businessSearchRequestFailed)
                    return
                }
                guard response.statusCode == 200 else {
                    completion(nil, .businessSearchRequestFailed)
                    return
                }
                
                // Decode the data into the model
                do {
                    
                    let decoder = JSONDecoder()
                    
                    let dic = try JSONSerialization.jsonObject(with: data)
                    let json = try JSONSerialization.data(withJSONObject: dic)
                    let bs_model = try decoder.decode(BusinessSearchModel.self, from: json)
                    
                    completion(bs_model, nil)
                    
                } catch {
                    print(error)
                    completion(nil, .businessSearchRequestFailed)
                }
            } else {
                completion(nil, .businessSearchRequestFailed)
            }
        }
        task.resume()
    }
    
    
    public func getBusinessReview(id: String, completion: @escaping (BusinessReviewModel?, APIError?) -> Void) {
        
        // Prepare URL & parameters for request to Yelp API
        guard let url = URL(string: Defaults.BASE_URL + "/" + id + "/reviews") else {
            completion(nil, .businessReviewsRequestFailed)
            return
        }
        
        // Initialize the GET Request with the URL
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(Defaults.API_KEY)", forHTTPHeaderField: "Authorization")
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        // Send GET Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let _ = error {
                completion(nil, .businessReviewsRequestFailed)
            } else if let data = data {
                
                // Validate Server Response
                guard let response = response as? HTTPURLResponse else {
                    completion(nil, .businessSearchRequestFailed)
                    return
                }
                guard response.statusCode == 200 else {
                    completion(nil, .businessSearchRequestFailed)
                    return
                }
                
                // Decode the data into a model
                do {
                    
                    let rv_model = try JSONDecoder().decode(BusinessReviewModel.self, from: data)
                    completion(rv_model, nil)
                    
                } catch {
                    completion(nil, .businessReviewsRequestFailed)
                }
                
            } else {
                completion(nil, .businessReviewsRequestFailed)
            }
        }
        task.resume()
    }
    
}
