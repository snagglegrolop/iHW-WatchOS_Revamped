//
//  TestView.swift
//  iHW-WatchOS Watch App
//
//  Created by Zachary Abrahamson  on 1/30/23.
//

import SwiftUI

// Our observable object class
class GameSettings: ObservableObject {
    @Published var score = 0
}

// A view that expects to find a GameSettings object
// in the environment, and shows its score.
struct ScoreView: View {
    @EnvironmentObject var settings: GameSettings

    var body: some View {
        Text("Score: \(settings.score)")
    }
}

// A view that creates the GameSettings object,
// and places it into the environment for the
// navigation stack.
struct ContentTest: View {
    @StateObject var settings = GameSettings()

    var body: some View {
            VStack {
                // A button that writes to the environment settings
                Button("Increase Score") {
                    settings.score += 1
                }
               
                    ScoreView()
                
                Button("Decrease Score") {
                    settings.score -= 1
                }
            }
        
        .environmentObject(settings)
    }
}

struct ContentTest_Previews: PreviewProvider {
    static var previews: some View {
        ContentTest()
    }
}


