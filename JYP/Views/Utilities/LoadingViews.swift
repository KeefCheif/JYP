//
//  LoadingViews.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import SwiftUI

struct GenericLoadingView: View {
    
    var message: String?
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: self.colorScheme == .light ? Color(UIColor.systemGray.withAlphaComponent(0.9)) : Color(UIColor.white.withAlphaComponent(0.9))))
                .scaleEffect(3)
                .padding()
            
            if let message = message {
                Text(message)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .font(.subheadline)
            }
        }
    }
}

struct GenericLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        GenericLoadingView()
    }
}
