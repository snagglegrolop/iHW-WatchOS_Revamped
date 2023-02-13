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
    @Published var selectedTab = "TodaySchoolDay"
    
    @Published var Per1_StartTimeLong = ""
    @Published var Per1_EndTimeLong = ""
    @Published var Per2_StartTimeLong = ""
    @Published var Per2_EndTimeLong = ""
    @Published var Break_StartTimeLong = ""
    @Published var Break_EndTimeLong = ""
    @Published var Per3_StartTimeLong = ""
    @Published var Per3_EndTimeLong = ""
    @Published var Per4_StartTimeLong = ""
    @Published var Per4_EndTimeLong = ""
    @Published var Per5_StartTimeLong = ""
    @Published var Per5_EndTimeLong = ""
    @Published var Per6_StartTimeLong = ""
    @Published var Per6_EndTimeLong = ""
    @Published var Per7_StartTimeLong = ""
    @Published var Per7_EndTimeLong = ""
    @Published var Per8_StartTimeLong = ""
    @Published var Per8_EndTimeLong = ""
    @Published var Per9_StartTimeLong = ""
    @Published var Per9_EndTimeLong = ""
    
    @Published var MScounter: Int = 0
    @Published var xmlDateMS = ""
    @Published var lessThanFiveMinTrue = false
    @Published var SchoolDidEndVar = false
    
    
    func MSgetInfo(futuredays: Int) {
        let url = "https://www.hw.com/portals/0/reports/DailySchedulesMS.xml?t="
        let urlRequest = URLRequest(url: URL(string: url)!)
        URLCache.shared.removeCachedResponse(for: urlRequest)
        
        AF.request("https://www.hw.com/portals/0/reports/DailySchedulesMS.xml?t=").responseString { response in
            
            
            if let string = response.value {
                print("hey")
                print(" ")
                let xml = XMLHash.parse(string)
                let FutureDays: Int = futuredays
                self.DayDateLong = (xml["Calendar"]["CalendarDay"][FutureDays]["DayDateLong"].element?.text)!
                self.CycleDay = (xml["Calendar"]["CalendarDay"][FutureDays]["CycleDay"].element?.text)!
                self.DivisionDescription = (xml["Calendar"]["CalendarDay"][FutureDays]["DivisionDescription"].element?.text)!
                self.SchoolDayDescription = (xml["Calendar"]["CalendarDay"][FutureDays]["SchoolDayDescription"].element?.text)!
                self.Per1_StartTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][0]["StartTimeText"].element?.text)!
                self.Per1_EndTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][0]["EndTimeText"].element?.text)!
                self.Per2_StartTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][1]["StartTimeText"].element?.text)!
                self.Per2_EndTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][1]["EndTimeText"].element?.text)!
                self.Break_StartTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][2]["StartTimeText"].element?.text)!
                self.Break_EndTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][2]["EndTimeText"].element?.text)!
                self.Per3_StartTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][3]["StartTimeText"].element?.text)!
                self.Per3_EndTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][3]["EndTimeText"].element?.text)!
                self.Per4_StartTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][4]["StartTimeText"].element?.text)!
                self.Per4_EndTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][4]["EndTimeText"].element?.text)!
                self.Per5_StartTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][5]["StartTimeText"].element?.text)!
                self.Per5_EndTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][5]["EndTimeText"].element?.text)!
                self.Per6_StartTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][6]["StartTimeText"].element?.text)!
                self.Per6_EndTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][6]["EndTimeText"].element?.text)!
                self.Per7_StartTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][7]["StartTimeText"].element?.text)!
                self.Per7_EndTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][7]["EndTimeText"].element?.text)!
                self.Per8_StartTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][8]["StartTimeText"].element?.text)!
                self.Per8_EndTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][8]["EndTimeText"].element?.text)!
                self.Per9_StartTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][9]["StartTimeText"].element?.text)!
                self.Per9_EndTime = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][9]["EndTimeText"].element?.text)!
                
                
                self.Per1_StartTimeLong = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][0]["StartTime"].element?.text)!
                self.Per1_EndTimeLong = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][0]["EndTime"].element?.text)!
                self.Per2_StartTimeLong = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][1]["StartTime"].element?.text)!
                self.Per2_EndTimeLong = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][1]["EndTime"].element?.text)!
                self.Break_StartTimeLong = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][2]["StartTime"].element?.text)!
                self.Break_EndTimeLong = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][2]["EndTime"].element?.text)!
                self.Per3_StartTimeLong = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][3]["StartTime"].element?.text)!
                self.Per3_EndTimeLong = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][3]["EndTime"].element?.text)!
                self.Per4_StartTimeLong = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][4]["StartTime"].element?.text)!
                self.Per4_EndTimeLong = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][4]["EndTime"].element?.text)!
                self.Per5_StartTimeLong = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][5]["StartTime"].element?.text)!
                self.Per5_EndTimeLong = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][5]["EndTime"].element?.text)!
                self.Per6_StartTimeLong = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][6]["StartTime"].element?.text)!
                self.Per6_EndTimeLong = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][6]["EndTime"].element?.text)!
                self.Per7_StartTimeLong = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][7]["StartTime"].element?.text)!
                self.Per7_EndTimeLong = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][7]["EndTime"].element?.text)!
                self.Per8_StartTimeLong = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][8]["StartTime"].element?.text)!
                self.Per8_EndTimeLong = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][8]["EndTime"].element?.text)!
                self.Per9_StartTimeLong = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][9]["StartTime"].element?.text)!
                self.Per9_EndTimeLong = (xml["Calendar"]["CalendarDay"][FutureDays]["Period"][9]["EndTime"].element?.text)!
                self.xmlDateMS = (xml["Calendar"]["CalendarDay"][FutureDays]["Date"].element?.text)!
                
                
                print("It is \(self.DayDateLong), but it is a \(self.DivisionDescription) day \(self.CycleDay)")
                print(type(of: self.DayDateLong))
                print("Period 1 starts at \(self.Per1_StartTime)")
                
                
            }
            
        }
    }
    
    @Published var isHoliday = false
    
    func tabLoad() {
        if self.isHoliday == true {
            self.selectedTab = "Holiday"
        }
        
        else if Date().dayOfWeek()! == "Saturday" || Date().dayOfWeek()! == "Sunday" {
            self.selectedTab = "Weekend"
        } else {
            self.selectedTab = "TodaySchoolDay"
        }
    }
    
}


struct USMSSelect: View {
    @State public var MiddleNav : Bool = false
    @State public var UpperNav : Bool = false
    @State var ButtonLook = GrowingButton2()
    @StateObject var xmlinfo = XMLInfo()
    
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
                    xmlinfo.MSgetInfo(futuredays: 0)
                    xmlinfo.tabLoad()
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
        .environmentObject(xmlinfo)
        .navigationDestination(isPresented: $MiddleNav) {
            MiddleSchoolSchedule(xmlinfo: xmlinfo)
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
