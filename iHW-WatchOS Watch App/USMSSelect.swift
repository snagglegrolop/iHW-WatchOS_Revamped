//
//  Schedule.swift
//  iHW-WatchOS Watch App
//
//  Created by Zachary Abrahamson  on 1/7/23.
//

import SwiftUI
import UIKit

struct GrowingButton2: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 70)
            .padding()
            .background(.red)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .scaleEffect(configuration.isPressed ? 1.0 : 0.8)
            .animation(.easeInOut(duration: 0.4), value: configuration.isPressed)
        
        
    }
}

struct USMSSelect: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 10){
                
                NavigationLink(destination: UpperSchoolSchedule()) {
                    Text("Upper School Schedule")
                }
                        .buttonStyle(GrowingButton2())
                        .font(.system(size: 26))
                        .bold()
                        .padding(.top, 10)
                NavigationLink(destination: MiddleSchoolSchedule()) {
                    Text("Middle School Schedule")
                }
                        .buttonStyle(GrowingButton2())
                        .font(.system(size: 26))
                        .bold()
                
            }
        }
    }
}

struct Schedule_Previews: PreviewProvider {
    static var previews: some View {
        USMSSelect()
    }
}
