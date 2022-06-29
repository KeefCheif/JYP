//
//  BusinessListTopNav.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import SwiftUI

struct BusinessListTopNav: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    @Binding var city: Locations?
    
    var body: some View {
        HStack {
        // - - - - - Back Button (Returns to Home Screen) - - - - - //
            Button(action: {
                self.city = nil
            }, label: {
                HStack {
                    Image(systemName: "chevron.left")
                        .resizable().scaledToFit().frame(width: 10).foregroundColor(.white)
                    
                    Text("Cities")
                        .font(.headline).bold().foregroundColor(.white)
                }
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(UIColor.gray.withAlphaComponent(0.75))))
            })
            Spacer()
        }
        .padding(5)
    }
}
