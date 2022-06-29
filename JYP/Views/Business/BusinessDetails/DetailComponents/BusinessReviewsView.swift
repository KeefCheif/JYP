//
//  BusinessReviewsView.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import SwiftUI

struct BusinessReviewsView: View {
    
    @StateObject var review_model: BusinessReviewsViewModel
    
    var body: some View {
        
        if self.review_model.isLoading {
            GenericLoadingView()
        } else {
            
            GeometryReader { geo in
                VStack {
                    Text("Reviews")
                        .font(.headline).bold().foregroundColor(.white).padding(10)
                    
                    PagingView(review_model: self.review_model)
                }
                .frame(maxWidth: .infinity, maxHeight: geo.size.height/2)
                .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(UIColor.gray.withAlphaComponent(0.9))))
            }
            .onAppear {
                UIPageControl.appearance().currentPageIndicatorTintColor = .black
                UIPageControl.appearance().pageIndicatorTintColor = .white
            }
            .alert("Review Error", isPresented: .constant(self.review_model.api_error != nil), actions: {
                Button("Okay", role: .cancel, action: {
                    self.review_model.api_error = nil
                })
            }, message: {
                if let error = self.review_model.api_error {
                    Text(error.localizedDescription)
                }
            })
        }
    }
}

struct BusinessReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessReviewsView(review_model: BusinessReviewsViewModel(id: "lJAGnYzku5zSaLnQ_T6_GQ"))
    }
}

struct PagingView: View {
    
    @ObservedObject var review_model: BusinessReviewsViewModel
    
    var body: some View {
        
        TabView {
            ForEach(self.review_model.reviews?.reviews ?? [ReviewModel](), id: \.self) { review in
                VStack(spacing: 10) {
                    HStack {
                        
                // - - - - - Review Rating - - - - - //
                        HStack {
                            ForEach(1...5, id: \.self) { index in
                                if review.rating >= index {
                                    Image(systemName: "star.square.fill")
                                        .ratingFormat().symbolRenderingMode(.palette).foregroundStyle(.white, .red)
                                } else {
                                    Image(systemName: "star.square")
                                        .ratingFormat().foregroundColor(.white)
                                }
                            }
                        }
                        
                        Text(review.user.name)
                            .font(.headline).bold().foregroundColor(.white)
                    }
                    
                    Text(review.text)
                        .font(.caption).bold().foregroundColor(.white)
                }
                .padding(20)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}
