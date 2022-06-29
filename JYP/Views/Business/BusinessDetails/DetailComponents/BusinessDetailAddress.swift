//
//  BusinessDetailAddress.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import SwiftUI

struct BusinessDetailAddress: View {
    
    var location: BusinessLocation?
    
    var body: some View {
        
        VStack {
            if let location = location {
                
                Text(location.address1 ?? "Address Unknown")
                    .addressFormat()
                
                if let address2 = location.address2 {
                    Text(address2)
                        .addressFormat()
                }
                
                if let address3 = location.address3 {
                    Text(address3)
                        .addressFormat()
                }
                
            } else {
                
                Text("Address Unknown")
                    .addressFormat()
            }
        }
        .padding(10)
    }
}

struct BusinessDetailAddress_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDetailAddress()
    }
}
