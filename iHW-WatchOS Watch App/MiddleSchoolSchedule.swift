//
//  MiddleSchoolSchedule.swift
//  iHW-WatchOS Watch App
//
//  Created by Zachary Abrahamson  on 1/8/23.
//

import SwiftUI
import SWXMLHash

class XMLData : ObservableObject {
    @Published var CycleDay = Int.random(in: 1...6)
    @Published var SchoolDayDescription = "MS Day "
    let Brumble = ["Break", "Assembly", "Special Assembly", "Break"]
}

struct MiddleSchoolSchedule: View {
    @StateObject var xmldata = XMLData()
    var body: some View {
        let Brumbly = xmldata.Brumble.randomElement()!

        
        VStack {
            Text("Today is \(xmldata.SchoolDayDescription)\(xmldata.CycleDay)")
                .padding()
                .font(.title3)
                .bold()
                .foregroundColor(.red)

            Form {
                Text("Period 1")
                Text("Period 2")
                Text(Brumbly)
                Text("Period 3")
                Text("Period 4")
                Text("Period 5")
                Text("Period 6")
                Text("Period 7")
                Text("Period 8")
                Text("Period 9")
                
            }
        }
    }
}

struct MiddleSchoolSchedule_Previews: PreviewProvider {
    static var previews: some View {
        MiddleSchoolSchedule()
    }
}



/*let SchoolDayDescription = ["MS Day 1",
                            "MS Day 2",
                            "MS Day 3",
                            "MS Day 4",
                            "MS Day 5",
                            "MS Day 6",
                            "MS Day 6 with Assembly",
                            "MS Day 5 with Assembly",
                            "MS Day 4 with Assembly",
                            "MS Day 3 with Assembly",
                            "MS Day 2 with Assembly",
                            "MS Day 1 with Assembly",
                            "MS Day 6 with Special Assembly",
                            "MS Day 5 with Special Assembly",
                            "MS Day 4 with Special Assembly",
                            "MS Day 3 with Special Assembly",
                            "MS Day 2 with Special Assembly",
                            "MS Day 1 with Special Assembly"] */
