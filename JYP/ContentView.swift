//
//  ContentView.swift
//  JYP
//
//  Created by peter allgeier on 6/27/22.
//

import SwiftUI
import CoreLocationUI

struct ContentView: View {
    
    @StateObject private var location_manager = LocationManager()
    
    var body: some View {
        VStack {
            /*
            Text("\(Environment.BASE_URL)")
            Text("\(Environment.API_KEY)")
            
            if let location = self.location_manager.location {
                Text("Location = Lat: \(location.latitude), Long: \(location.longitude)")
            }
            
            LocationButton {
                self.location_manager.requestLocation()
            }
            */
            
            Text("Hello World")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
