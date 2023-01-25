//
//  Sign_In.swift
//  iHW-WatchOS Watch App
//
//  Created by Zachary Abrahamson  on 1/4/23.
//

import SwiftUI
import SWXMLHash
import Alamofire
import Foundation

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
            .scaleEffect(!securityManager.isSignInButtonDisabled ? 1 : 0.7)
            .animation(.easeInOut(duration: 0.8), value: !securityManager.isSignInButtonDisabled)

    };}

struct CD: XMLObjectDeserialization {
    let TITLE: String
    let ARTIST: String
    let COUNTRY: String
    let COMPANY: String
    let PRICE: Double
    let YEAR: Int

    static func deserialize(_ node: XMLIndexer) throws -> CD {
        return try CD (
            TITLE: node["TITLE"].value(),
            ARTIST: node["ARTIST"].value(),
            COUNTRY: node["COUNTRY"].value(),
            COMPANY: node["COMPANY"].value(),
            PRICE: node["PRICE"].value(),
            YEAR : node.value(ofAttribute: "YEAR")
        )
    }
}



struct Sign_In: View {
    @State public var readyToNavigate : Bool = false
    @AppStorage("username") private var username = ""
    @AppStorage("password") private var password = ""
    @StateObject var securityManager = SecurityManager()
    let count = 0...26
    var body: some View {
         NavigationStack {
             VStack {
                Form {
                    TextField("Username", text: $username)
                    SecureField("Password", text: $password)
                }
                .scrollDisabled(true)
                .submitLabel(.next)
                .onSubmit {
                    if username.isEmpty == false && password.isEmpty == false {
                        securityManager.isSignInButtonDisabled = false } else {
                            securityManager.isSignInButtonDisabled = true
                            print("authworks?")
                        }
                }
                Button {
                   if username.isEmpty == false && password.isEmpty == false {
                       readyToNavigate = true } else {
                           readyToNavigate = false
                       }
                    AF.request("https://www.hw.com/portals/0/reports/DailySchedulesMS.xml?t=").responseString { response in
                        if let string = response.value {
                            print("\(string)")
                            print("  ")
                            for number in count {
                                print(" ")
                                print("hey \(number)")
                                let xml = XMLHash.parse(string)
                                print(xml["Calendar"]["CalendarDay"][number]["DayDateShort"].element?.text as Any)
                            }
                            let calendar = NSCalendar.current
                            print(calendar)
                        }
                    }
                        
               } label: {
                   Text("Sign In")
                       .bold()
                       .foregroundColor(.white)
                       .font(.title2)
                       .onAppear(perform: {
                           DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                               if username.isEmpty == false && password.isEmpty == false {
                                   securityManager.isSignInButtonDisabled = false } else {
                                       securityManager.isSignInButtonDisabled = true
                                   }
                           }
                       }
                           )
                   
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
        Sign_In()
    }
}
