//
//  Homepage.swift
//  iHW-WatchOS Watch App
//
//  Created by Zachary Abrahamson  on 1/3/23.
//

import SwiftUI


struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.red)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeInOut(duration: 0.4), value: configuration.isPressed)
        
        
    }
}



struct Homepage: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 30) {
                    NavigationLink(destination: Sign_In()) {
                        Text("Sign In")
                        
                    }
                    .buttonStyle(GrowingButton())
                    .accentColor(.black)
                    .font(.title3)
                    .bold()
                    
                    
                    NavigationLink(destination: About()) {
                        Text(" About ")
                        
                        
                    }
                    .accentColor(.black)
                    .buttonStyle(GrowingButton())
                    .font(.title3)
                    .bold()
                    
                }
                
            }
        }
        
    }
}
    

    

    
struct Homepage_Previews: PreviewProvider {
        static var previews: some View {
            Homepage()
        }
    }


