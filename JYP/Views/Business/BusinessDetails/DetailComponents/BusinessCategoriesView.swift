//
//  BusinessCategoriesView.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import SwiftUI

struct BusinessCategoriesView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    var categories: [BusinessCategory]?
    
    var body: some View {
        
        if let categories = self.categories {
            
            HStack(spacing: 5) {
             
                if categories.count > 5 {
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(categories, id: \.self) { category in
                                Text("#\(category.alias!)")
                                    .categoryFormat()
                            }
                        }
                    }
                    
                } else {
                    ForEach(categories, id: \.self) { category in
                        Text("#\(category.alias!)")
                            .categoryFormat()
                    }
                }
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(Rectangle().foregroundColor(self.colorScheme == .dark ? .white : .black))
            
        } else {
            Text("This business is not tagged")
        }
    }
}

struct BusinessCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessCategoriesView()
    }
}

extension Text {
    func categoryFormat() -> some View {
        self.font(.caption).bold().italic().foregroundColor(.red)
    }
}
