//
//  MiddleSchoolSchedule.swift
//  iHW-WatchOS Watch App
//
//  Created by Zachary Abrahamson  on 1/8/23.
//

import SwiftUI
import SWXMLHash
import Alamofire



struct MiddleSchoolSchedule: View {
    @ObservedObject var xmlinfo: XMLInfo
    var body: some View {
        VStack {
            Text("Today is \(xmlinfo.DayDateLong)")
                .padding()
                .font(.title3)
                .bold()
                .foregroundColor(.red)
                
             
            Form {
                Text("Period 1")
                Text("Period 2")
                Text("Break")
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
        MiddleSchoolSchedule(xmlinfo: XMLInfo())
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
