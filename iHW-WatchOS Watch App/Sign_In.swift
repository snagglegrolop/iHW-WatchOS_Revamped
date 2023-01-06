//
//  Login.swift
//  iHW-WatchOS Watch App
//
//  Created by --  on 1/4/23.
//

import SwiftUI



struct Sign_In: View {
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        Form {
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
            
        }
        .onSubmit {
            guard username.isEmpty == false && password.isEmpty == false else { return }
            print("Authenticating…")
        }
        .submitLabel(.next)
    }
}
struct UsernamePasswordEnter_Preview: PreviewProvider {
    static var previews: some View {
        Sign_In()
    }
}
