//
//  BusinessDetailRating.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import SwiftUI

struct BusinessDetailRatingLikes: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    @ObservedObject var view_model: BusinessListViewModel
    var business: BusinessSearchBusiness
    
    var rating: Double {
        return self.business.rating ?? 0.0
    }
    
    var body: some View {
        
        HStack {
            
            HStack {
                ForEach(1...5, id: \.self) { index in
                    
                    if self.rating >= Double(index) {
                        
                        Image(systemName: "star.circle.fill")
                            .ratingFormat().symbolRenderingMode(.palette).foregroundStyle(.white, .red)
                        
                    } else if Double(index) - self.rating == 0.5 {
                        
                        Image(systemName: "star.circle.fill")
                            .ratingFormat().symbolRenderingMode(.palette).foregroundStyle(.red, .white)
                        
                    } else {
                        
                        Image(systemName: "star.circle.fill")
                            .ratingFormat().foregroundColor(.white)
                    }
                }
                
                Text(String(format: "%.1f", self.rating))
                    .font(.headline).bold().italic().foregroundColor(.white)
            }
            
            
        }
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(UIColor.gray.withAlphaComponent(0.75))))
    }
}
