//
//  Login.swift
//  iHW-WatchOS Watch App
//
//  Created by Zachary Abrahamson  on 1/4/23.
//

import SwiftUI



struct Sign_In: View {
    var body: some View {
        VStack {
        
            }
        }
    }
struct UsernameEnter: View {
    @State var Username = ""
    var body: some View {
        TextField("Username", text: $Username, axis: .horizontal)
            .padding(.bottom, 90)
    }
}

struct Sign_In_Preview: PreviewProvider {
    static var previews: some View {
        UsernameEnter()
        
    }
}
