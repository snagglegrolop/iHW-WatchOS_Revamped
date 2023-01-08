//
//  Sign_In.swift
//  iHW-WatchOS Watch App
//
//  Created by Zachary Abrahamson  on 1/4/23.
//

import SwiftUI

extension Color {
    static let teal = Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255)
    static let darkPink = Color(red: 252 / 255, green: 8 / 255, blue: 128 / 255)
}

class SecurityManager : ObservableObject {
    @Published var isSignInButtonDisabled = true
}

struct SignButton: ButtonStyle {
    @ObservedObject var securityManager: SecurityManager
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        
            .frame(height: 50)
            .frame(maxWidth: .infinity) // how to make a button fill all the space available horizontaly
            .background(
                securityManager.isSignInButtonDisabled ?
                LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                    LinearGradient(colors: [Color.darkPink, .red, Color.darkPink], startPoint: .bottomLeading, endPoint: .topTrailing)
            )
            .cornerRadius(15)
            .disabled(securityManager.isSignInButtonDisabled) // how to disable while some condition is applied
            .padding()
    };}

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        Sign_In() }
    
    }

struct Sign_In: View {
    @State private var readyToNavigate : Bool = false
    @State private var username = ""
    @State private var password = ""
    @StateObject var securityManager = SecurityManager()
     var body: some View {
         NavigationStack {
            VStack {
                Form {
                    TextField("Username", text: $username)
                    SecureField("Password", text: $password)
                }
                .submitLabel(.next)
                .onSubmit {
                    if username.isEmpty == false && password.isEmpty == false {
                        securityManager.isSignInButtonDisabled = false } else {
                            securityManager.isSignInButtonDisabled = true
                        }
                }
                Button {
                   if username.isEmpty == false && password.isEmpty == false {
                       readyToNavigate = true } else {
                           readyToNavigate = false
                       }
               } label: {
                   Text("Sign In")
                       .bold()
                       .foregroundColor(.white)
                       .font(.title2)
               }
               .buttonStyle(SignButton(securityManager: securityManager))
           }
            .navigationDestination(isPresented: $readyToNavigate) {
                USMSSelect()
           }
        }
    }
}


struct Sign_In_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
