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
            Form {
                Text("App idea by Zachary, but code put into motion by Zachary Abrahamson '26, Andrew Jo '26, and Kazach '26")
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
