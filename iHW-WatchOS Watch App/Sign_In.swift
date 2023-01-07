//
//  Login.swift
//  iHW-WatchOS Watch App
//
//  Created by --  on 1/4/23.
//

import SwiftUI

var logged = false

struct Sign_In: View {
    @State private var username = ""
    @State private var password = ""
    @State var tag : Int? = nil
    
    var body: some View {
        Form {
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
        }
        
        
        .onSubmit {
            guard username.isEmpty == false && password.isEmpty == false else { return }
            let logged = true
            print(logged)
            if logged == true {
                self.tag = 1
                print("im a reall boy")
                NavigationStack {
                    NavigationLink(destination: Schedule(), tag: 1, selection: $tag) {
                        EmptyView()
                    }.disabled(true)
                }
            }
                                       
            
        }
        .submitLabel(.next)
        
    }
}





struct UsernamePasswordEnter_Preview: PreviewProvider {
    static var previews: some View {
        Sign_In()
    }
}

