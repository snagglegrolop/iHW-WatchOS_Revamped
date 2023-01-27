//
//  SwiftUIView.swift
//  iHW-WatchOS Watch App
//
//  Created by Zachary Abrahamson  on 1/26/23.
//

import SwiftUI

struct test2: View {
    @StateObject var person = Person()
    @State private var computedValue = 0
    
    var body: some View {
        
        List {
            Text("age = \(person.age)")
            Text("computedValue = \(computedValue)")
            Button {
                person.age = Int.random(in: 1...80)
            } label: {
                Text("Randomly Change Age")
            }

        }
        // This will do your initial setup
        .onAppear {
            Task {
                computedValue = await compute(person.age)     /// Executed much too often :(
            }
        }
        // This will keep it current
        .onReceive(person.objectWillChange) { _ in
            Task {
                computedValue = await compute(person.age)     /// Executed much too often :(
            }
        }
    }
    
    func compute(_ age: Int) async -> Int {
        //This is just to simulate heavy work.
        do {
            try await Task.sleep(nanoseconds: UInt64(3.0 * Double(NSEC_PER_SEC)))
        } catch {
            //handle error
        }
        return age * 2  /// In real life, heavy computing
    }
}

class Person: ObservableObject {
    @Published var age: Int = 0
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        test2()
    }
}
