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

class studentSchedule: ObservableObject {
    
}

class XMLInfo: ObservableObject {
    @Published var DayDateLong = ""
    @Published var CycleDay = ""
    @Published var DivisionDescription = ""
    @Published var SchoolDayDescription = ""
    @Published var Per1_StartTime = ""
    @Published var Per1_EndTime = ""
    @Published var Per2_StartTime = ""
    @Published var Per2_EndTime = ""
    @Published var Break_StartTime = ""
    @Published var Break_EndTime = ""
    @Published var Per3_StartTime = ""
    @Published var Per3_EndTime = ""
    @Published var Per4_StartTime = ""
    @Published var Per4_EndTime = ""
    @Published var Per5_StartTime = ""
    @Published var Per5_EndTime = ""
    @Published var Per6_StartTime = ""
    @Published var Per6_EndTime = ""
    @Published var Per7_StartTime = ""
    @Published var Per7_EndTime = ""
    @Published var Per8_StartTime = ""
    @Published var Per8_EndTime = ""
    @Published var Per9_StartTime = ""
    @Published var Per9_EndTime = ""
    
    
    
}
 


struct USMSSelect: View {
    @State public var MiddleNav : Bool = false
    @State public var UpperNav : Bool = false
    @State var ButtonLook = GrowingButton2()
    @ObservedObject var xmlinfo = XMLInfo()
    @StateObject var securityManager = SecurityManager()
    var body: some View {
        NavigationStack {
            VStack(spacing: 10){
                Text(" ")
                    .font(.system(size: 10))
                Button {
                    UpperNav = true
                    
                } label: {
                    Text("  Upper School Schedule  ")
                        .multilineTextAlignment(.center)
                        .bold()
                        .foregroundColor(.white)
                        .font(.system(size: 26))
                    
                    
                }
                .buttonStyle(ButtonLook)
                
                Button {
                    
                    AF.request("https://www.hw.com/portals/0/reports/DailySchedulesMS.xml?t=").responseString { response in
                        if let string = response.value {
                                print("hey")
                                print(" ")
                                let xml = XMLHash.parse(string)
                            let FutureDays: Int = 4
                            
                            xmlinfo.DayDateLong = (xml["Calendar"]["CalendarDay"][FutureDays]["DayDateLong"].element?.text)!
                            
                            xmlinfo.CycleDay = (xml["Calendar"]["CalendarDay"][FutureDays]["CycleDay"].element?.text)!
                            
                            xmlinfo.DivisionDescription = (xml["Calendar"]["CalendarDay"][FutureDays]["DivisionDescription"].element?.text)!
                            
                            xmlinfo.SchoolDayDescription = (xml["Calendar"]["CalendarDay"][FutureDays]["SchoolDayDescription"].element?.text)!
                            
                            xmlinfo.Per1_StartTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][0]["StartTimeText"].element?.text)!
                                
                            xmlinfo.Per1_EndTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][0]["EndTimeText"].element?.text)!
                            
                            xmlinfo.Per2_StartTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][1]["StartTimeText"].element?.text)!
                            
                            xmlinfo.Per2_EndTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][1]["EndTimeText"].element?.text)!
                            
                            xmlinfo.Break_StartTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][2]["StartTimeText"].element?.text)!
                            
                            xmlinfo.Break_EndTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][2]["EndTimeText"].element?.text)!
                            
                            xmlinfo.Per3_StartTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][3]["StartTimeText"].element?.text)!
                                
                            xmlinfo.Per3_EndTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][3]["EndTimeText"].element?.text)!
                            
                            xmlinfo.Per4_StartTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][4]["StartTimeText"].element?.text)!
                            
                            xmlinfo.Per4_EndTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][4]["EndTimeText"].element?.text)!
                            
                            xmlinfo.Per5_StartTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][5]["StartTimeText"].element?.text)!
                            
                            xmlinfo.Per5_EndTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][5]["EndTimeText"].element?.text)!
                            
                            xmlinfo.Per6_StartTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][6]["StartTimeText"].element?.text)!
                            
                            xmlinfo.Per6_EndTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][6]["EndTimeText"].element?.text)!
                            
                            xmlinfo.Per7_StartTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][7]["StartTimeText"].element?.text)!
                            
                            xmlinfo.Per7_EndTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][7]["EndTimeText"].element?.text)!
                            
                            xmlinfo.Per8_StartTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][8]["StartTimeText"].element?.text)!
                            
                            xmlinfo.Per8_EndTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][8]["EndTimeText"].element?.text)!
                            
                            xmlinfo.Per9_StartTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][9]["StartTimeText"].element?.text)!
                            
                            xmlinfo.Per9_EndTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][9]["EndTimeText"].element?.text)!
                            
                            
                            
                            print("It is \(xmlinfo.DayDateLong), but it is a \(xmlinfo.DivisionDescription) day \(xmlinfo.CycleDay)")
                            print(type(of: xmlinfo.DayDateLong))
                            print("Period 1 starts at \(xmlinfo.Per1_StartTime)")
                            
                            let DayDateLong = xmlinfo.DayDateLong
                            print(DayDateLong)
                        }
                    }
                    MiddleNav = true

                } label: {
                    
                        Text("Middle School Schedule")
                            .multilineTextAlignment(.center)
                            .bold()
                            .foregroundColor(.white)
                            .font(.system(size: 25.5))
                      
                    
                }
                .buttonStyle(ButtonLook)
            }
        }
        .navigationDestination(isPresented: $MiddleNav) {
            MiddleSchoolSchedule(
                    DayDateLong: $xmlinfo.DayDateLong, CycleDay: $xmlinfo.CycleDay, DivisionDescription: $xmlinfo.DivisionDescription, SchoolDayDescription: $xmlinfo.SchoolDayDescription, Per1_StartTime: $xmlinfo.Per1_StartTime, Per1_EndTime: $xmlinfo.Per1_EndTime, Per2_StartTime: $xmlinfo.Per2_StartTime, Per2_EndTime: $xmlinfo.Per2_EndTime, Break_StartTime: $xmlinfo.Break_StartTime, Break_EndTime: $xmlinfo.Break_EndTime, Per3_StartTime: $xmlinfo.Per3_StartTime, Per3_EndTime: $xmlinfo.Per3_EndTime, Per4_StartTime: $xmlinfo.Per4_StartTime, Per4_EndTime: $xmlinfo.Per4_EndTime, Per5_StartTime: $xmlinfo.Per5_StartTime, Per5_EndTime: $xmlinfo.Per5_EndTime, Per6_StartTime: $xmlinfo.Per6_StartTime, Per6_EndTime: $xmlinfo.Per6_EndTime, Per7_StartTime: $xmlinfo.Per7_StartTime, Per7_EndTime: $xmlinfo.Per7_EndTime, Per8_StartTime: $xmlinfo.Per8_StartTime, Per8_EndTime: $xmlinfo.Per8_EndTime, Per9_StartTime: $xmlinfo.Per9_StartTime, Per9_EndTime: $xmlinfo.Per9_EndTime)
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


        
