//
//  Login.swift
//  iHW-WatchOS Watch App
//
//  Created by --  on 1/4/23.
//

import SwiftUI
var logged = false

extension Color {
    static let teal = Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255)
    static let darkPink = Color(red: 252 / 255, green: 8 / 255, blue: 288 / 255)
}

class SecurityManager : ObservableObject {
    @Published var isSignInButtonDisabled = true
}


struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        Sign_In() }
    
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
                    LinearGradient(colors: [Color.darkPink, .orange], startPoint: .bottomLeading, endPoint: .topTrailing)
            )
            .cornerRadius(15)
            .disabled(securityManager.isSignInButtonDisabled) // how to disable while some condition is applied
            .padding()
    };}

struct Sign_In: View {
    @State private var username = ""
    @State private var password = ""
    @StateObject var securityManager = SecurityManager()
    let Banana_Uppity = Image("Banana_Up")
    let Banana_Dancity = Image("Banana_Dance")
    var body: some View {
        VStack {
            NavigationStack {
                Form {
                    TextField("Username", text: $username)
                    SecureField("Password", text: $password)
                }
                
                
                .onSubmit {
                    if username.isEmpty == false && password.isEmpty == false {
                        securityManager.isSignInButtonDisabled = false } else {
                            securityManager.isSignInButtonDisabled = true }
                }
                
            }
            .submitLabel(.next)
            NavigationLink(destination: Schedule()) {
                Text("Sign In")
            }
            .buttonStyle(SignButton(securityManager: securityManager))
            .bold()
            .foregroundColor(.white)
            .font(.title2)
            
        }
    }
}






struct UsernamePasswordEnter_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

