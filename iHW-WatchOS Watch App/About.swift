//
//  SwiftUIView.swift
//  iHW-WatchOS Watch App
//
//  Created by Zachary Abrahamson  on 1/4/23.
//

import SwiftUI
import UIKit

struct About: View {
    var body: some View {
        VStack{
            Form {
                Text("App made by Zachary Abrahamson.")
                    .multilineTextAlignment(.center)
                    .fontWeight(.light)
                Text("iHW built from the ground up for Apple WatchOS")
                    .multilineTextAlignment(.center)
                    .fontWeight(.light)
                Text("With the help of Jonathan Damico")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 0)
                    .fontWeight(.light)
                Text("Project started in January of 2022")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .fontWeight(.light)
            }
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
