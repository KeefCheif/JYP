//
//  BusinessDetailView.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import SwiftUI

struct BusinessDetailView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    @ObservedObject var view_model: BusinessListViewModel
    @Binding var business: BusinessSearchBusiness?
    
    private var categories: [String] {
        if let cat = business?.categories {
            return cat.map { $0.title ?? "" }
        } else {
            return [String]()
        }
    }
    
    var thumbnail: UIImage {
        if let imageUrl = self.business?.image_url {
            return imageUrl.loadURLImage()
        } else {
            return UIImage(named: "notFound")!
        }
    }
    
    var body: some View {
        if let business = business {
            VStack(spacing: 0) {
            
        // - - - - - Thumbnail, Rating, & Back Button - - - - - //
                VStack(alignment: .leading) {
                    
                    BusinessDetailTopNav(business: self.$business)
                    
                    Spacer()
                    
                    BusinessDetailRatingLikes(view_model: self.view_model, business: business)
                        
                }
                .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.size.height/3)
                .background(Image(uiImage: self.thumbnail).resizable().scaledToFill().frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.size.height/3).clipped())
                
        // - - - - - Business Details - - - - - //
                VStack {
                    
            // - - - - - Title & Like Status - - - - - //
                    
                    BusinessTitleLikeView(view_model: self.view_model, business: business)
                    
            // - - - - - Categories - - - - - //
                    
                    BusinessCategoriesView(categories: business.categories)
            
            // - - - - - Reviews - - - - - //
                   
                    BusinessReviewsView(review_model: BusinessReviewsViewModel(id: business.id!))
                    
            // - - - - - Address - - - - - //
                    
                    BusinessDetailAddress(location: business.location)
                }
        
                Spacer()
            }
            .statusBar(hidden: true)
            .edgesIgnoringSafeArea(.top)
            
        } else {
            Text("Business Data Missing")
        }
    }
}

extension Image {
    func ratingFormat() -> some View {
        self.resizable().scaledToFit().frame(width: 20)
    }
}

extension Text {
    func addressFormat() -> some View {
        self.font(.caption).bold().foregroundColor(.blue)
    }
}
