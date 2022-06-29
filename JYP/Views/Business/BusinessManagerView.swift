//
//  BusinessManagerView.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import SwiftUI

struct BusinessManagerView: View {
    
    @StateObject var view_model: BusinessListViewModel
    
    @Binding var city: Locations?
    
    @State var business: BusinessSearchBusiness?
    
    var body: some View {
        
        if self.view_model.isLoading {
            GenericLoadingView()
        } else {
            if let _ = self.business {
                BusinessDetailView(view_model: self.view_model, business: self.$business)
            } else {
                BusinessListView(view_model: self.view_model, city: self.$city, business: self.$business)
            }
        }
    }
}

struct BusinessManagerView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessManagerView(view_model: BusinessListViewModel(latitude: Locations.Denver.lat, longitude: Locations.Denver.long), city: .constant(.Denver))
    }
}
