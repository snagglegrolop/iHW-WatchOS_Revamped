//
//  UpperSchoolSchedule.swift
//  iHW-WatchOS Watch App
//
//  Created by Zachary Abrahamson  on 1/8/23.
//

import SwiftUI




struct UpperSchoolSchedule: View {
    let toDay = Int.random(in: 1...6)
    var body: some View {
        VStack{
            Text("Today is Day \(toDay)")
                .padding()
                .font(.system(size: 10, weight: .bold))
                
                .foregroundColor(.red)
            Form {
                Text("Block 1")
                //etc figuring out how the schedule works and then doing a switch case (if then else) for how the structure will be, focusing mainly on middleschool schedule though for right now becuase i don't know where to start for high school. idk how it works
            }
            
        }
    }
}



struct UpperSchoolSchedule_Previews: PreviewProvider {
    static var previews: some View {
        UpperSchoolSchedule()
    }
}
