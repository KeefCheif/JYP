//
//  HomeScreenManagerView.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import SwiftUI
import CoreLocationUI

struct HomeScreenManagerView: View {

    @StateObject private var location_manager: LocationManager = LocationManager()
    
    var body: some View {
        
        if let city = self.location_manager.city {
            
            BusinessManagerView(view_model: BusinessListViewModel(latitude: city.lat, longitude: city.long), city: self.$location_manager.city)
            
        } else {
            
            GeometryReader { geo in
                
                VStack {
                    
                    Text("Select Location")
                        .font(.title2).bold()
                    
                    HStack {
                        
                        LocationListItem(geo: geo, location: .Atlanta, city: self.$location_manager.city)
                        
                        LocationListItem(geo: geo, location: .Chicago, city: self.$location_manager.city)
                    }
                    
                    HStack {
                        
                        LocationListItem(geo: geo, location: .Denver, city: self.$location_manager.city)
                        
                        LocationListItem(geo: geo, location: .New_York, city: self.$location_manager.city)
                    }
                    
                    HStack {
                        
                        LocationListItem(geo: geo, location: .San_Diego, city: self.$location_manager.city)
                        
                        LocationListItem(geo: geo, location: .San_Francisco, city: self.$location_manager.city)
                    }
                    
                    LocationButton {
                        self.location_manager.requestLocation()
                    }
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    
                    if self.location_manager.isLoading {
                        GenericLoadingView()
                            .frame(width: 30, height: 30)
                    }
                }
                .position(x: geo.size.width/2, y: geo.size.height/2)
            }
            .frame(maxWidth: .infinity)
            
            .alert("Location Error", isPresented: .constant(self.location_manager.location_error != nil), actions: {
                Button("Okay", role: .cancel, action: { self.location_manager.location_error = nil })
            }, message: {
                if let error = self.location_manager.location_error {
                    Text(error.localizedDescription)
                }
            })
        }
    }
}

struct HomeScreenManagerView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenManagerView()
    }
}
