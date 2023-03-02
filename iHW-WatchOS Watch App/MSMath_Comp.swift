//
//  Math_Comp.swift
//  iHW-WatchOS Watch App
//
//  Created by Zachary Abrahamson  on 2/3/23.
//



import Foundation
import SwiftUI
import UserNotifications




struct PeriodUntilTextFinished: View {
    @ObservedObject var xmlinfo: XMLInfo
    @State private var Finished = ""
    @State var Array = ["", "", ""]
    @State var ToDateArray = ""
    @State var customdate = Date()
    @State private var TimeDif = ""
    @State var nextPeriod = ""
    @State var nextPeriodText = ""
    @State var SchoolWillEndVar = false
    @State var FiveMinColor: Color = .red
    @State var endingWeekday = ""
    var body: some View {
        VStack {
            Spacer().frame(height: 15)
            Text(TimeDif)
                .multilineTextAlignment(.center)
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(FiveMinColor)
        }.onAppear {
            getNearestPeriod()
            let date = Date()
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy/MM/dd"
            ToDateArray = dateformatter.string(from: date)
            
        }
    }
    
    private func getNearestPeriod() {        
        xmlinfo.MSgetInfo(futuredays: xmlinfo.MScounter)
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
    
            if xmlinfo.DayDateLong == "Having trouble connecting to internet" {
                xmlinfo.MSgetInfo(futuredays: xmlinfo.MScounter)
            } else {
                var timersArray: [Double] = []
                let StartTimeArray = [xmlinfo.Per1_StartTimeLong, xmlinfo.Per2_StartTimeLong, xmlinfo.Break_StartTimeLong, xmlinfo.Per3_StartTimeLong, xmlinfo.Per4_StartTimeLong, xmlinfo.Per5_StartTimeLong, xmlinfo.Per6_StartTimeLong, xmlinfo.Per7_StartTimeLong, xmlinfo.Per8_StartTimeLong, xmlinfo.Per9_StartTimeLong, xmlinfo.Per9_EndTimeLong]
                for Starts in StartTimeArray {
                    let TimesArray = GetDiffSeconds(stringXML: Starts)
                        timersArray.append(TimesArray)
                }
                
                if timersArray[0] >= 0.0 {
                    if timersArray[0] <= 300.0 {
                        xmlinfo.lessThanFiveMinTrue = true
                        
                        
                    } else if timersArray[0] > 300.0  {
                        xmlinfo.lessThanFiveMinTrue = false
                        
                    }
                    
                    
                    nextPeriod = xmlinfo.Per1_StartTimeLong
                    nextPeriodText = "Period 1"
                    
//                    print("Per1 is next")
                } else if timersArray[1] >= 0.0 {
                    if timersArray[1] <= 300.0 {
                        xmlinfo.lessThanFiveMinTrue = true
                        

                    } else if timersArray[1] > 300.0 {
                        xmlinfo.lessThanFiveMinTrue = false
                        
                        
                    }
                    nextPeriod = xmlinfo.Per2_StartTimeLong
                    nextPeriodText = "Period 2"
                    
//                    print("Per2 is next")
                } else if timersArray[2] >= 0.0 {
                    if timersArray[2] <= 300.0 {
                        xmlinfo.lessThanFiveMinTrue = true
                        

                    } else if timersArray[2] > 300.0 {
                        xmlinfo.lessThanFiveMinTrue = false
                        
                        
                    }
                    
                    nextPeriod = xmlinfo.Break_StartTimeLong
                    nextPeriodText = "Break"
                    
//                    print("Break is next")
                } else if timersArray[3] >= 0.0 {
                    if timersArray[3] <= 300.0 {
                        xmlinfo.lessThanFiveMinTrue = true
                        

                    } else if timersArray[3] > 300.0 {
                        xmlinfo.lessThanFiveMinTrue = false
                        
                        
                    }
                    nextPeriod = xmlinfo.Per3_StartTimeLong
                    nextPeriodText = "Period 3"
                    
//                    print("Per4 is next")
                } else if timersArray[4] >= 0.0 {
                    if timersArray[4] <= 300.0 {
                        xmlinfo.lessThanFiveMinTrue = true
                        

                    } else if timersArray[4] > 300.0 {
                        xmlinfo.lessThanFiveMinTrue = false
                        
                        
                    }
                    nextPeriod = xmlinfo.Per4_StartTimeLong
                    nextPeriodText = "Period 4"
                    
//                    print("Per5 is next")
                } else if timersArray[5] >= 0.0 {
                    if timersArray[5] <= 300.0 {
                        xmlinfo.lessThanFiveMinTrue = true
                        

                    } else if timersArray[5] > 300.0 {
                        xmlinfo.lessThanFiveMinTrue = false
                        
                        
                    }
                    nextPeriod = xmlinfo.Per5_StartTimeLong
                    nextPeriodText = "Period 5"
                    
//                    print("Per6 is next")
                } else if timersArray[6] >= 0.0 {
                    if timersArray[6] <= 300.0 {
                        xmlinfo.lessThanFiveMinTrue = true
                        

                    } else if timersArray[6] > 300.0 {
                        xmlinfo.lessThanFiveMinTrue = false
                        
                        
                    }
                    nextPeriod = xmlinfo.Per6_StartTimeLong
                    nextPeriodText = "Period 6"
                    
//                    print("Per7 is next")
                } else if timersArray[7] >= 0.0 {
                    if timersArray[7] <= 300.0 {
                        xmlinfo.lessThanFiveMinTrue = true
                        

                    } else if timersArray[7] > 300.0 {
                        xmlinfo.lessThanFiveMinTrue = false
                        
                        
                    }
                    nextPeriod = xmlinfo.Per7_StartTimeLong
                    nextPeriodText = "Period 7"
//                    print("Per8 is next")
                } else if timersArray[8] >= 0.0 {
                    if timersArray[8] <= 300.0 {
                        xmlinfo.lessThanFiveMinTrue = true
                        

                    } else if timersArray[8] > 300.0 {
                        xmlinfo.lessThanFiveMinTrue = false
                        
                        
                    }
                    nextPeriod = xmlinfo.Per8_StartTimeLong
                    nextPeriodText = "Period 8"
                    
//                    print("Per9 is next")
                } else if timersArray[9] >= 0.0 {
                    if timersArray[9] <= 300.0 {
                        xmlinfo.lessThanFiveMinTrue = true
                        

                    } else if timersArray[9] > 300.0 {
                        xmlinfo.lessThanFiveMinTrue = false
                        
                        
                    }
                    nextPeriod = xmlinfo.Per9_StartTimeLong
                    nextPeriodText = "Period 9"
//                    print("Per9End is next")
                } else if timersArray[10] >= 0.0 {
                    if timersArray[10] <= 300.0 {
                        xmlinfo.lessThanFiveMinTrue = true
                        

                    } else if timersArray[10] > 300.0 {
                        xmlinfo.lessThanFiveMinTrue = false
                        
                        
                    }
                    nextPeriod = xmlinfo.Per9_EndTimeLong
                    SchoolWillEndVar = true
                    nextPeriodText = "School"
//                    print("School ends next")
                } else if timersArray[10] <= 0.0 {
//                    print("school ended already")
                    xmlinfo.SchoolDidEndVar = true
                    SchoolWillEndVar = false
                    xmlinfo.lessThanFiveMinTrue = false
                    nextPeriod = xmlinfo.Per9_EndTimeLong
                    
                    
                    
                }
                if xmlinfo.lessThanFiveMinTrue {
                    
                    FiveMinColor = .red
                } else if !xmlinfo.lessThanFiveMinTrue {
                    FiveMinColor = .purp
                }
                
                
            }
            
            let (h,m,s) = secondsToHoursMinutesSeconds(Int(GetDiffSeconds(stringXML: nextPeriod)))
            if xmlinfo.SchoolDidEndVar {
                TimeDif = "School is over"
            } else {
                if SchoolWillEndVar {
                    if h == 0 && m == 0 {
                        TimeDif = "\(nextPeriodText) ends in \(s) seconds"
                    } else if h == 0 {
                        TimeDif = "\(nextPeriodText) ends in \(m) minutes and \(s) seconds"
                    } else {
                        TimeDif = "\(nextPeriodText) ends in \(h) hours, \(m) minutes, and \(s) seconds"
                    }
                } else if !SchoolWillEndVar {
                    if h == 0 && m == 0 {
                        TimeDif = "\(nextPeriodText) begins in \(s) seconds"
                    } else if h == 0 {
                        TimeDif = "\(nextPeriodText) begins in \(m) minutes and \(s) seconds"
                    } else {
                        TimeDif = "\(nextPeriodText) begins in \(h) hours, \(m) minutes, and \(s) seconds"
                    }
                }
            }
        }
    }
    
    func GetDiffSeconds(stringXML: String) -> TimeInterval {
        let str = stringXML
        Array = str.components(separatedBy: " ")
        xmlinfo.Finished = "\(ToDateArray), \(Array[1]), \(Array[2])"
        

        let mydate = DateFormatter()
        mydate.dateFormat = "yyyy/MM/dd, hh:mm:ss, a"
        let weekform = DateFormatter()
        weekform.dateFormat = "EEEE"
        let BeginStrings = mydate.string(from: Date())
        let beginning = mydate.date(from: BeginStrings)
        let ending = mydate.date(from: xmlinfo.Finished)
        let diffinSeconds = ending!.timeIntervalSinceReferenceDate - beginning!.timeIntervalSinceReferenceDate
        return(diffinSeconds)
        
    }


    private func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }

}



struct Cont_Previews: PreviewProvider {
    static var previews: some View {
        Content()
    }
}

struct Content: View {
    @ObservedObject var xmlinfo = XMLInfo()
    var body: some View {
        PeriodUntilTextFinished(xmlinfo: xmlinfo)
        
    }
 }

