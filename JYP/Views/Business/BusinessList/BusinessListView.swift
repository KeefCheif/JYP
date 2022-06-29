//
//  BusinessListView.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import SwiftUI

struct BusinessListView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    @ObservedObject var view_model: BusinessListViewModel
    
    @Binding var city: Locations?
    @Binding var business: BusinessSearchBusiness?
    
    var body: some View {
        
        VStack {
            
    // - - - - - Nav Bar - - - - - //
            
            BusinessListTopNav(city: self.$city)
            
    // - - - - - Businesses - - - - - //
            
            ScrollView {
                ForEach(self.view_model.businesses_model.businesses ?? [], id: \.self) { business in
                    
                    VStack(spacing: 0) {
                        
                        VStack {
                            if let image_url = business.image_url {
                                Image(uiImage: image_url.loadURLImage())
                                    .businessMedia()
                            } else {
                                ZStack {
                                    Image("notFound")
                                        .businessMedia()
                                    
                                    Text("Image Unavailable")
                                        .font(.title2).bold().foregroundColor(.black)
                                }
                            }
                        }
                    // Double Tap gesture for liking via tapping the image of a business
                        .onTapGesture(count: 2, perform: {
                            if self.view_model.liked[business.id!] == nil {
                                self.view_model.liked[business.id!] = 1
                            } else {
                                self.view_model.liked[business.id!] = nil
                            }
                        })
                        .border(self.colorScheme == .dark ? .white : .black, width: 10)
                        
                        HStack {
                            
                    // Business Detail Navigation Button (switches view rendered in the Business Manager View
                            Button(action: {
                                self.business = business
                            }, label: {
                                Text("\(business.name!)")
                                    .font(.headline).bold().foregroundColor(.blue).italic().padding(10)
                            })
                            
                            Spacer()
                            
                    // Another like button so the user can tap the heart icon
                            Button(action: {
                                if self.view_model.liked[business.id!] == nil {
                                    self.view_model.liked[business.id!] = 1
                                } else {
                                    self.view_model.liked[business.id!] = nil
                                }
                            }, label: {
                                if self.view_model.liked[business.id!] == nil {
                                    Image(systemName: "heart")
                                        .likeImage()
                                } else {
                                    Image(systemName: "heart.fill")
                                        .likeImage()
                                }
                            })
                        }
                        .frame(maxWidth: .infinity).background(Rectangle().foregroundColor(self.colorScheme == .dark ? .white : .black))
                    }
                    .padding([.horizontal], 10)
                }
            }
        }
    }
}

extension Image {
    func businessMedia() -> some View {
        self.resizable().scaledToFill().frame(maxWidth: .infinity)
    }
    
    func likeImage() -> some View {
        self.resizable().scaledToFit().frame(width: 20).foregroundColor(.red).padding(10)
    }
}

extension String {
    func loadURLImage() -> UIImage {
        do {
            guard let url = URL(string: self) else { return UIImage() }
            let data: Data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
        } catch {
            return UIImage(imageLiteralResourceName: "notFound")
        }
    }
}
