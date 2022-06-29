//
//  BusinessDetailTopNav.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import SwiftUI

struct BusinessDetailTopNav: View {
    
    @Binding var business: BusinessSearchBusiness?
    
    var body: some View {
        HStack {
            Button(action: {
                self.business = nil
            }, label: {
                HStack {
                    Image(systemName: "chevron.left")
                        .resizable().scaledToFit().frame(width: 10).foregroundColor(.white)
                    
                    Text("Businesses")
                        .font(.headline).bold().foregroundColor(.white)
                }
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(UIColor.gray.withAlphaComponent(0.75))))
            })
            Spacer()
        }
        .padding(5)
        .padding([.top], 30)
    }
}
