//
//  MiddleSchoolSchedule.swift
//  iHW-WatchOS Watch App
//
//  Created by Zachary Abrahamson  on 1/8/23.
//



import SwiftUI
import UserNotifications

extension Color {
    static let purp = Color(red: 109 / 255, green: 175 / 255, blue: 199 / 255)
}


extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}


extension String {
    func convertToNextDate(dateFormat: String, validity: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let myDate = dateFormatter.date(from: self)!
        let tomorrow = Calendar.current.date(byAdding: .day, value: validity, to: myDate)
        return dateFormatter.string(from: tomorrow!)
    }
}



struct MiddleSchoolSchedule: View {
    
    
   
    
    let Gold = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    
    @State private var showingAlert = false
    
    @State var PreviousDay = "Prior Day"
    @ObservedObject var xmlinfo: XMLInfo
    
    
    let thisDate = Date()
    static var thisFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "eeee, MMM dd, yyyy"
        return df
    }
    
    var os: Double {
        if #available(watchOS 9.0, *) {
            return 9.0
        } else {
            return 8.5
        }
    }
    var body: some View {
        VStack {
            Text("\(xmlinfo.MScounter == 0 ? "\(MiddleSchoolSchedule.thisFormatter.string(from: Date()))" : xmlinfo.DayDateLong)")
                .font(.system(size: 10))
            HStack {
                Button {
                    if xmlinfo.MScounter >= 1 {
                        xmlinfo.MScounter -= 1
                    } else {
                        PreviousDay = "Error"
                        showingAlert = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            PreviousDay = "Prior Day"
                        }
                        
                    }
                    
                    xmlinfo.MSgetInfo(futuredays: xmlinfo.MScounter)
                    
                } label: {
                    Text(PreviousDay)
                        .font(.system(size: 15))
                    
                    
                }
                .alert("You can't go back further than today.", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                    
                }
                Divider().frame(height: RelativeWidth(CurrentWidth: 20))
                
                Button {
                    xmlinfo.MScounter += 1
                    xmlinfo.MSgetInfo(futuredays: xmlinfo.MScounter)
                    
                } label: {
                    Text("Next Day")
                        .font(.system(size: 15))
                }    
            }
            
            Spacer()
                .frame(height: RelativeWidth(CurrentWidth: 5))
          
            VStack(alignment: .center, spacing: -3) {
                Divider().frame(width: RelativeWidth(CurrentWidth: 140))
                
                
                Spacer()
                    .frame(height: RelativeWidth(CurrentWidth: 5))
                List {
                    
                    Button {
                        if !xmlinfo.isSentforWifi {
                            xmlinfo.MSgetInfo(futuredays: xmlinfo.MScounter)
                        }
                    } label: {
                        
                        
                        if !xmlinfo.isSentforWifi {
                            PeriodUntilTextFinished(xmlinfo: xmlinfo)
                                .padding(.horizontal, 20)
                        } else {
                            VStack(alignment: .center, spacing: -7) {
                                Text("\(xmlinfo.SchoolDayDescription)")
                                    .font(.system(size: RelativeWidth(CurrentWidth: 12)))
                                    .multilineTextAlignment(.center)
                                    .ignoresSafeArea()
                                    .padding(.horizontal)
                                Spacer()
                                    .frame(height: 17)
                                Divider().frame(width: RelativeWidth(CurrentWidth: 120))
                                
                                
                                if xmlinfo.MScounter == 0 {
                                    PeriodUntilTextFinished(xmlinfo: xmlinfo)
                                } else if xmlinfo.MScounter > 0 {
                                    Spacer().frame(height: 15)
                                    Text("You are \(xmlinfo.MScounter) school days in the future")
                                        .font(.system(size: 15, weight: .bold))
                                        .padding(.horizontal, 1)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.orange)
                                }
                                
                            }
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                
                
                
            }
            
        }

        
    }
    
}


struct MSSView: View {
    @ObservedObject var xmlinfo = XMLInfo()
    var body: some View {
        MiddleSchoolSchedule(xmlinfo: xmlinfo)
        
    }
}

struct MiddleSchool_Previews: PreviewProvider {
    static var previews: some View {
        MSSView()
    }
}
