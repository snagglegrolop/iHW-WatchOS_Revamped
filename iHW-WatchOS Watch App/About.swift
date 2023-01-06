//
//  SwiftUIView.swift
//  iHW-WatchOS Watch App
//
//  Created by Zachary Abrahamson  on 1/4/23.
//

import SwiftUI

struct About: View {
    var body: some View {
        VStack{
            Text("Proof of concept made")
                .multilineTextAlignment(.center)
                .padding(.top, 0.5)
                .fontWeight(.light)
            Text("by Zachary Abrahamson")
                .multilineTextAlignment(.center)
                .fontWeight(.light)
                .padding(.bottom, 0.5)
            Text("iHW built from the ground up for WatchOS")
                .multilineTextAlignment(.center)
                .padding(.bottom, 0)
                .fontWeight(.light)
            Text("With the help of Jonathan Damico")
                .multilineTextAlignment(.center)
                .padding(.top, 0)
                .fontWeight(.light)
            Text("Project started in January of 2022")
                .multilineTextAlignment(.center)
                .padding(.top, 0.5)
                .fontWeight(.light)

        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
