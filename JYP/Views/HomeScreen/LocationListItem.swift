//
//  LocationListItem.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import SwiftUI

struct LocationListItem: View {
    
    var geo: GeometryProxy
    var location: Locations
    
    @Binding var city: Locations?
    
    var body: some View {
        
        Button(action: {
            self.city = self.location
        }, label: {
            ZStack {
                
                Image(self.location.name)
                    .cityIcon(geo: self.geo)
                
                Text(self.location.name)
                    .cityName()
            }
        })
    }
}

struct LocationListItem_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            LocationListItem(geo: geo, location: .Denver, city: .constant(nil))
        }
    }
}

extension Image {
    func cityIcon(geo: GeometryProxy) -> some View {
        self.resizable().scaledToFill().frame(width: geo.size.width/2.25, height: geo.size.width/2.25).clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

extension Text {
    func cityName() -> some View {
        self.font(.title2).foregroundColor(.white).bold()
    }
}
