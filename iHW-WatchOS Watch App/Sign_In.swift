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



struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State public var isSignInButtonDisabled: Bool
    var body: some View {
        Sign_In(isSignInButtonDisabled: $isSignInButtonDisabled) }
    
    }




struct Sign_In: View {
    @State private var username = ""
    @State private var password = ""
    @Binding var isSignInButtonDisabled: Bool
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
            guard username.isEmpty == false && password.isEmpty == false else { return }
            
            }
        }
        .submitLabel(.next)
            
            Button {
                } label: {
                Text("Sign In")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity) // how to make a button fill all the space available horizontaly
            .background(
                isSignInButtonDisabled ?
                LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                    LinearGradient(colors: [Color.darkPink, .orange], startPoint: .bottomLeading, endPoint: .topTrailing)
            )
            .cornerRadius(15)
            .disabled(isSignInButtonDisabled) // how to disable while some condition is applied
            .padding()
        }
    }
}


struct SignButton: ButtonStyle {
    @Binding var isSignInButtonDisabled: Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        
            .frame(height: 50)
            .frame(maxWidth: .infinity) // how to make a button fill all the space available horizontaly
            .background(
                isSignInButtonDisabled ?
                LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                    LinearGradient(colors: [Color.darkPink, .orange], startPoint: .bottomLeading, endPoint: .topTrailing))
    };}



struct UsernamePasswordEnter_Preview: PreviewProvider {
    static var previews: some View {
        ContentView(isSignInButtonDisabled: $isSignInButtonDisabled)
        
    }
}


/*import SwiftUI

struct Sign_In: View {
    @EnvironmentObject var pageManager: PageManager
    var body: some View {
        switch pageManager.page {
        case .top:
            top()

        case .view2:
            view2()
        }
    }
}


struct top: View {
    @EnvironmentObject var pageManager: PageManager
    
    @State private var username = ""
    @State private var password = ""
    @State var tag : Int? = nil
    
    var body: some View {
        Form {
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
        }
        
        
        .onSubmit {
            guard (username.isEmpty != true && password.isEmpty != true) else { return }
            pageManager.page = .view2
        
    }
        .submitLabel(.next)
    };}
        

struct view2: View {
    @EnvironmentObject var pageManager: PageManager
    var body: some View {
        VStack {
            Text("View2")
                .padding()

            Button("To top"){
                pageManager.page = .top
            }
            .padding()
        }
    }
}

enum Page {
    case top
    case view2
}

class PageManager: ObservableObject{
    @Published var page: Page = .top
}

struct Sign_In_Previews: PreviewProvider {
    static var previews: some View {
        Sign_In()
            .environmentObject(PageManager())
    }
}
*/
