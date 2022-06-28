//
//  ContentView.swift
//  JYP
//
//  Created by peter allgeier on 6/27/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("\(Environment.BASE_URL)")
            Text("\(Environment.API_KEY)")
            Text("CRAP")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
