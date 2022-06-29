//
//  BusinessTitleLikeView.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import SwiftUI

struct BusinessTitleLikeView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    @ObservedObject var view_model: BusinessListViewModel
    
    var business: BusinessSearchBusiness
    
    var body: some View {
        HStack {
            
            Text(business.name!)
                .font(.headline).bold().foregroundColor(self.colorScheme == .dark ? .black : .white).padding(10)
            
            Spacer()
            
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
}
