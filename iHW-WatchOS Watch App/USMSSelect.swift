//
//  Schedule.swift
//  iHW-WatchOS Watch App
//
//  Created by Zachary Abrahamson  on 1/7/23.
//

import SwiftUI
import Alamofire
import SWXMLHash

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

class XMLInfo : ObservableObject {
    @Published var DayDateLong = "  "
    @Published var CycleDay = "  "
    @Published var DivisionDescription = "  "
    @Published var SchoolDayDescription = "  "
}

struct USMSSelect: View {
    @State public var MiddleNav : Bool = false
    @State public var UpperNav : Bool = false
    @State var ButtonLook = GrowingButton2()
    @StateObject var xmlinfo = XMLInfo()
    let count = 0...26
    var body: some View {
        NavigationStack {
            VStack(spacing: 10){
                Text(" ")
                    .font(.system(size: 10))
                Button {
                    UpperNav = true
                    
                } label: {
                    Text(" Upper School Schedule  ")
                        .multilineTextAlignment(.center)
                        .bold()
                        .foregroundColor(.white)
                        .font(.system(size: 26))
                    
                    
                }
                .buttonStyle(ButtonLook)
                
                Button {
                    MiddleNav = true
                    
                } label: {
                    Text("Middle School Schedule")
                        .multilineTextAlignment(.center)
                        .bold()
                        .foregroundColor(.white)
                        .font(.system(size: 26))
                    
                    
                }
                .buttonStyle(ButtonLook)
            }
        }
        /*NavigationLink(destination: MiddleSchoolSchedule()) {
         Text("Middle School Schedule")
         }
         .buttonStyle(GrowingButton2())
         .font(.system(size: 26))
         .bold()
         
         */
        .navigationDestination(isPresented: $MiddleNav) {
            MiddleSchoolSchedule()
        }
        .navigationDestination(isPresented: $UpperNav) {
            UpperSchoolSchedule()
        }
        
    }
}
    


struct Schedule_Previews: PreviewProvider {
    static var previews: some View {
        USMSSelect()
    }
}


/*
 AF.request("https://www.hw.com/portals/0/reports/DailySchedulesMS.xml?t=").responseString { response in
     if let string = response.value {
         for number in count {
             print(" ")
             print("hey \(number)")
             let xml = XMLHash.parse(string)
             xmlinfo.DayDateLong = (xml["Calendar"]["CalendarDay"][number]["DayDateLong"].element?.text)!
             xmlinfo.CycleDay = (xml["Calendar"]["CalendarDay"][number]["CycleDay"].element?.text)!
             xmlinfo.DivisionDescription = (xml["Calendar"]["CalendarDay"][number]["DivisionDescription"].element?.text)!
             print("It is \(xmlinfo.DayDateLong), but it is a \(xmlinfo.DivisionDescription) day \(xmlinfo.CycleDay)")
         }
     }
 }
 */
