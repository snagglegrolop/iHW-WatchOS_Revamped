//
//  MiddleSchoolSchedule.swift
//  iHW-WatchOS Watch App
//
//  Created by Zachary Abrahamson  on 1/8/23.
//

import SwiftUI
import SWXMLHash
import Alamofire

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}




struct MiddleSchoolSchedule: View {
    
    
    
    @State var isHoliday = true
    @State var Per1_MS = false
    @State var Per2_MS = false
    @State var Break_MS = false
    @State var Per3_MS = false
    @State var Per4_MS = false
    @State var Per5_MS = false
    @State var Per6_MS = false
    @State var Per7_MS = false
    @State var Per8_MS = false
    @State var Per9_MS = false
    
  
    @State var MScounter: Int = 0
    @State var PreviousDay = "Previous Day"
    
    @State var GetStuff = USMSSelect()
    
    @ObservedObject var xmlinfo: XMLInfo
    @StateObject var xmlInfo = XMLInfo()
    @State var selectpage = USMSSelect()
    
    @State public var selectedTab : String = "TodaySchoolDay"

    var body: some View {
        NavigationStack {
            HStack {
                Button {
                    if MScounter >= 1 {
                        MScounter -= 1
                    } else {
                    PreviousDay = "Error"
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            PreviousDay = "Previous Day"
                        }

                    }
                    xmlinfo.MSgetInfo(futuredays: MScounter)
                    
                } label: {
                    Text(PreviousDay)
                        .font(.system(size: 12, weight: .light))
                        .tint(.red)
                        
                        

                }
                Button {
                    MScounter += 1
                    xmlinfo.MSgetInfo(futuredays: MScounter)

                } label: {
                    Text("Next Day")
                        .font(.system(size: 13))
                        

                }
                
                
                
            }
            TabView(selection: $selectedTab) {
                VStack {
                    WeekendView()
                }
                .tag("Weekend")
                
                VStack {
                    HolidayView()
                }
                .tag("Holiday")
                VStack (spacing: -5) {
                    List {
                        Group {
                            Button {
                            } label: {
                                Text("\(xmlinfo.DayDateLong)")
                                    .font(.footnote)
                                    .multilineTextAlignment(.center)
                                Text("Today is an \(xmlinfo.SchoolDayDescription)")
                                    .padding()
                                    .font(.system(size: 15))
                                    .bold()
                                    .foregroundColor(.red)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        .listRowBackground(Color.black)
                        Group {
                            Button {
                                Per1_MS = true
                                

                            } label: {
                                Text("Period 1")
                                Text("\(xmlinfo.Per1_StartTime) to \(xmlinfo.Per1_EndTime)")
                                    .font(.footnote)
                                
                            }
                            Button {
                                Per2_MS = true
                            } label: {
                                Text("Period 2")
                                Text("\(xmlinfo.Per2_StartTime) to \(xmlinfo.Per2_EndTime)")
                                    .font(.footnote)
                            }
                            Button {
                                Break_MS = true
                            } label: {
                                Text("Break")
                                Text("\(xmlinfo.Break_StartTime) to \(xmlinfo.Break_EndTime)")
                                    .font(.footnote)
                            }
                            Button {
                                Per3_MS = true
                            } label: {
                                Text("Period 3")
                                Text("\(xmlinfo.Per3_StartTime) to \(xmlinfo.Per3_EndTime)")
                                    .font(.footnote)
                            }
                            Button {
                                Per4_MS = true
                            } label: {
                                Text("Period 4")
                                Text("\(xmlinfo.Per4_StartTime) to \(xmlinfo.Per4_EndTime)")
                                    .font(.footnote)
                            }
                            Button {
                                Per5_MS = true
                            } label: {
                                Text("Period 5")
                                Text("\(xmlinfo.Per5_StartTime) to \(xmlinfo.Per5_EndTime)")
                                    .font(.footnote)
                            }
                            Button {
                                Per6_MS = true
                            } label: {
                                Text("Period 6")
                                Text("\(xmlinfo.Per6_StartTime) to \(xmlinfo.Per6_EndTime)")
                                    .font(.footnote)
                            }
                            Button {
                                Per7_MS = true
                            } label: {
                                Text("Period 7")
                                Text("\(xmlinfo.Per7_StartTime) to \(xmlinfo.Per7_EndTime)")
                                    .font(.footnote)
                            }
                            Button {
                                Per8_MS = true
                            } label: {
                                Text("Period 8")
                                Text("\(xmlinfo.Per8_StartTime) to \(xmlinfo.Per8_EndTime)")
                                    .font(.footnote)
                            }
                            Button {
                                Per9_MS = true
                            } label: {
                                Text("Period 9")
                                Text("\(xmlinfo.Per9_StartTime) to \(xmlinfo.Per9_EndTime)")
                                    .font(.footnote)
                            }
                        }
                    }
                    .preferredColorScheme(.dark)

                }
                .tag("TodaySchoolDay")
                
                TomorrowSchoolDay(DayDateLong: $xmlinfo.DayDateLong, CycleDay: $xmlinfo.CycleDay, DivisionDescription: $xmlinfo.DivisionDescription, SchoolDayDescription: $xmlinfo.SchoolDayDescription, Per1_StartTime: $xmlinfo.Per1_StartTime, Per1_EndTime: $xmlinfo.Per1_EndTime, Per2_StartTime: $xmlinfo.Per2_StartTime, Per2_EndTime: $xmlinfo.Per2_EndTime, Break_StartTime: $xmlinfo.Break_StartTime, Break_EndTime: $xmlinfo.Break_EndTime, Per3_StartTime: $xmlinfo.Per3_StartTime, Per3_EndTime: $xmlinfo.Per3_EndTime, Per4_StartTime: $xmlinfo.Per4_StartTime, Per4_EndTime: $xmlinfo.Per4_EndTime, Per5_StartTime: $xmlinfo.Per5_StartTime, Per5_EndTime: $xmlinfo.Per5_EndTime, Per6_StartTime: $xmlinfo.Per6_StartTime, Per6_EndTime: $xmlinfo.Per6_EndTime, Per7_StartTime: $xmlinfo.Per7_StartTime, Per7_EndTime: $xmlinfo.Per7_EndTime, Per8_StartTime: $xmlinfo.Per8_StartTime, Per8_EndTime: $xmlinfo.Per8_EndTime, Per9_StartTime: $xmlinfo.Per9_StartTime, Per9_EndTime: $xmlinfo.Per9_EndTime)
                
            }
            .tag("TomorrowSchoolDay")


        }
        
        .navigationDestination(isPresented: $Per1_MS) {
            Per1_Notes()
        }
        .navigationDestination(isPresented: $Per2_MS) {
            Per2_Notes()
        }
        .navigationDestination(isPresented: $Break_MS) {
            Break_Notes()
        }
        .navigationDestination(isPresented: $Per3_MS) {
            Per3_Notes()
        }
        .navigationDestination(isPresented: $Per4_MS) {
            Per4_Notes()
        }
        .navigationDestination(isPresented: $Per5_MS) {
            Per5_Notes()
        }
        .navigationDestination(isPresented: $Per6_MS) {
            Per6_Notes()
        }
        .navigationDestination(isPresented: $Per7_MS) {
            Per7_Notes()
        }
        .navigationDestination(isPresented: $Per8_MS) {
            Per8_Notes()
        }
        .navigationDestination(isPresented: $Per9_MS) {
            Per9_Notes()
        }
    }
}

struct TomorrowSchoolDay: View {
    @State var isHoliday = true
    @State var Per1_MS = false
    @State var Per2_MS = false
    @State var Break_MS = false
    @State var Per3_MS = false
    @State var Per4_MS = false
    @State var Per5_MS = false
    @State var Per6_MS = false
    @State var Per7_MS = false
    @State var Per8_MS = false
    @State var Per9_MS = false
    
    @Binding var DayDateLong: String
    @Binding var CycleDay: String
    @Binding var DivisionDescription: String
    @Binding var SchoolDayDescription: String
    @Binding var Per1_StartTime: String
    @Binding var Per1_EndTime: String
    @Binding var Per2_StartTime: String
    @Binding var Per2_EndTime: String
    @Binding var Break_StartTime: String
    @Binding var Break_EndTime: String
    @Binding var Per3_StartTime: String
    @Binding var Per3_EndTime: String
    @Binding var Per4_StartTime: String
    @Binding var Per4_EndTime: String
    @Binding var Per5_StartTime: String
    @Binding var Per5_EndTime: String
    @Binding var Per6_StartTime: String
    @Binding var Per6_EndTime: String
    @Binding var Per7_StartTime: String
    @Binding var Per7_EndTime: String
    @Binding var Per8_StartTime: String
    @Binding var Per8_EndTime: String
    @Binding var Per9_StartTime: String
    @Binding var Per9_EndTime: String
    
    @State var GetStuff = USMSSelect()
    
    @ObservedObject var xmlinfo = XMLInfo()
    
    var body: some View {
        
        NavigationStack {
                VStack (spacing: -5) {
                    List {
                        Group {
                            Button {
                            } label: {
                                Text("\(DayDateLong)")
                                    .font(.footnote)
                                    .multilineTextAlignment(.center)
                                Text("Today is an \(SchoolDayDescription)")
                                    .padding()
                                    .font(.system(size: 15))
                                    .bold()
                                    .foregroundColor(.red)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        .listRowBackground(Color.black)
                        Group {
                            Button {
                                Per1_MS = true
                                

                            } label: {
                                Text("Period 1")
                                Text("\(Per1_StartTime) to \(Per1_EndTime)")
                                    .font(.footnote)
                                
                            }
                            Button {
                                Per2_MS = true
                            } label: {
                                Text("Period 2")
                                Text("\(Per2_StartTime) to \(Per2_EndTime)")
                                    .font(.footnote)
                            }
                            Button {
                                Break_MS = true
                            } label: {
                                Text("Break")
                                Text("\(Break_StartTime) to \(Break_EndTime)")
                                    .font(.footnote)
                            }
                            Button {
                                Per3_MS = true
                            } label: {
                                Text("Period 3")
                                Text("\(Per3_StartTime) to \(Per3_EndTime)")
                                    .font(.footnote)
                            }
                            Button {
                                Per4_MS = true
                            } label: {
                                Text("Period 4")
                                Text("\(Per4_StartTime) to \(Per4_EndTime)")
                                    .font(.footnote)
                            }
                            Button {
                                Per5_MS = true
                            } label: {
                                Text("Period 5")
                                Text("\(Per5_StartTime) to \(Per5_EndTime)")
                                    .font(.footnote)
                            }
                            Button {
                                Per6_MS = true
                            } label: {
                                Text("Period 6")
                                Text("\(Per6_StartTime) to \(Per6_EndTime)")
                                    .font(.footnote)
                            }
                            Button {
                                Per7_MS = true
                            } label: {
                                Text("Period 7")
                                Text("\(Per7_StartTime) to \(Per7_EndTime)")
                                    .font(.footnote)
                            }
                            Button {
                                Per8_MS = true
                            } label: {
                                Text("Period 8")
                                Text("\(Per8_StartTime) to \(Per8_EndTime)")
                                    .font(.footnote)
                            }
                            Button {
                                Per9_MS = true
                            } label: {
                                Text("Period 9")
                                Text("\(Per9_StartTime) to \(Per9_EndTime)")
                                    .font(.footnote)
                            }
                        }
                    }
                    .preferredColorScheme(.dark)

                }
        }
        
        
        .navigationDestination(isPresented: $Per1_MS) {
            Per1_Notes()
        }
        .navigationDestination(isPresented: $Per2_MS) {
            Per2_Notes()
        }
        .navigationDestination(isPresented: $Break_MS) {
            Break_Notes()
        }
        .navigationDestination(isPresented: $Per3_MS) {
            Per3_Notes()
        }
        .navigationDestination(isPresented: $Per4_MS) {
            Per4_Notes()
        }
        .navigationDestination(isPresented: $Per5_MS) {
            Per5_Notes()
        }
        .navigationDestination(isPresented: $Per6_MS) {
            Per6_Notes()
        }
        .navigationDestination(isPresented: $Per7_MS) {
            Per7_Notes()
        }
        .navigationDestination(isPresented: $Per8_MS) {
            Per8_Notes()
        }
        .navigationDestination(isPresented: $Per9_MS) {
            Per9_Notes()
        }
        
    }
}

struct Per1_Notes: View {
    @AppStorage("Per1Notes") private var Per1Notes = ""
    @State private var showingConfirmation = false

    var body: some View {
        VStack {
            
            Text("Reset Note")
                .onTapGesture {
                    showingConfirmation = true
                        
                }
                .confirmationDialog("Are you sure you want to reset the notes?", isPresented: $showingConfirmation) {
                    Button("Please Delete!") { Per1Notes = "" }
                    Button("Oops! Take me back please.") { }
                    } message: {
                        Text("You can't get this back")
                    }
                
            TextField("Notes", text: $Per1Notes,  axis: .vertical)
        }
    }
}

struct Per2_Notes: View {
    @AppStorage("Per2Notes") private var Per2Notes = ""
    @State private var showingConfirmation = false

    var body: some View {
        VStack {
            
            Text("Reset Note")
                .onTapGesture {
                    showingConfirmation = true
                        
                }
                .confirmationDialog("Are you sure you want to reset the notes?", isPresented: $showingConfirmation) {
                    Button("Please Delete!") { Per2Notes = "" }
                    Button("Oops! Take me back please.") { }
                    } message: {
                        Text("You can't get this back")
                    }
                
            TextField("Notes", text: $Per2Notes,  axis: .vertical)
        }
    }
}

struct Break_Notes: View {
    @AppStorage("Break_Notes") private var Break_Notes = ""
    @State private var showingConfirmation = false

    var body: some View {
        VStack {
            
            Text("Reset Note")
                .onTapGesture {
                    showingConfirmation = true
                        
                }
                .confirmationDialog("Are you sure you want to reset the notes?", isPresented: $showingConfirmation) {
                    Button("Please Delete!") { Break_Notes = "" }
                    Button("Oops! Take me back please.") { }
                    } message: {
                        Text("You can't get this back")
                    }
                
            TextField("Notes", text: $Break_Notes,  axis: .vertical)
        }
    }
}

struct Per3_Notes: View {
    @AppStorage("Per3Notes") private var Per3Notes = ""
    @State private var showingConfirmation = false

    var body: some View {
        VStack {
            
            Text("Reset Note")
                .onTapGesture {
                    showingConfirmation = true
                        
                }
                .confirmationDialog("Are you sure you want to reset the notes?", isPresented: $showingConfirmation) {
                    Button("Please Delete!") { Per3Notes = "" }
                    Button("Oops! Take me back please.") { }
                    } message: {
                        Text("You can't get this back")
                    }
                
            TextField("Notes", text: $Per3Notes,  axis: .vertical)
        }
    }
}

struct Per4_Notes: View {
    @AppStorage("Per4Notes") private var Per4Notes = ""
    @State private var showingConfirmation = false

    var body: some View {
        VStack {
            
            Text("Reset Note")
                .onTapGesture {
                    showingConfirmation = true
                        
                }
                .confirmationDialog("Are you sure you want to reset the notes?", isPresented: $showingConfirmation) {
                    Button("Please Delete!") { Per4Notes = "" }
                    Button("Oops! Take me back please.") { }
                    } message: {
                        Text("You can't get this back")
                    }
                
            TextField("Notes", text: $Per4Notes,  axis: .vertical)
        }
    }
}

struct Per5_Notes: View {
    @AppStorage("Per5Notes") private var Per5Notes = ""
    @State private var showingConfirmation = false

    var body: some View {
        VStack {
            
            Text("Reset Note")
                .onTapGesture {
                    showingConfirmation = true
                        
                }
                .confirmationDialog("Are you sure you want to reset the notes?", isPresented: $showingConfirmation) {
                    Button("Please Delete!") { Per5Notes = "" }
                    Button("Oops! Take me back please.") { }
                    } message: {
                        Text("You can't get this back")
                    }
                
            TextField("Notes", text: $Per5Notes,  axis: .vertical)
        }
    }
}

struct Per6_Notes: View {
    @AppStorage("Per6Notes") private var Per6Notes = ""
    @State private var showingConfirmation = false

    var body: some View {
        VStack {
            
            Text("Reset Note")
                .onTapGesture {
                    showingConfirmation = true
                        
                }
                .confirmationDialog("Are you sure you want to reset the notes?", isPresented: $showingConfirmation) {
                    Button("Please Delete!") { Per6Notes = "" }
                    Button("Oops! Take me back please.") { }
                    } message: {
                        Text("You can't get this back")
                    }
                
            TextField("Notes", text: $Per6Notes,  axis: .vertical)
        }
    }
}

struct Per7_Notes: View {
    @AppStorage("Per7Notes") private var Per7Notes = ""
    @State private var showingConfirmation = false

    var body: some View {
        VStack {

            Text("Reset Note")
                .onTapGesture {
                    showingConfirmation = true
                        
                }
                .confirmationDialog("Are you sure you want to reset the notes?", isPresented: $showingConfirmation) {
                    Button("Please Delete!") { Per7Notes = "" }
                    Button("Oops! Take me back please.") { }
                    } message: {
                        Text("You can't get this back")
                    }
                
            TextField("Notes", text: $Per7Notes,  axis: .vertical)
        }
    }
}

struct Per8_Notes: View {
    @AppStorage("Per8Notes") private var Per8Notes = ""
    @State private var showingConfirmation = false

    var body: some View {
        VStack {
            
            Text("Reset Note")
                .onTapGesture {
                    showingConfirmation = true
                        
                }
                .confirmationDialog("Are you sure you want to reset the notes?", isPresented: $showingConfirmation) {
                    Button("Please Delete!") { Per8Notes = "" }
                    Button("Oops! Take me back please.") { }
                    } message: {
                        Text("You can't get this back")
                    }
                
            TextField("Notes", text: $Per8Notes,  axis: .vertical)
        }
    }
}

struct Per9_Notes: View {
    @AppStorage("Per9Notes") private var Per9Notes = ""
    @State private var showingConfirmation = false

    var body: some View {
        VStack {
            
            Text("Reset Note")
                .onTapGesture {
                    showingConfirmation = true
                        
                }
                .confirmationDialog("Are you sure you want to reset the notes?", isPresented: $showingConfirmation) {
                    Button("Please Delete!") { Per9Notes = "" }
                    Button("Oops! Take me back please.") { }
                    } message: {
                        Text("You can't get this back")
                    }
                
            TextField("Notes", text: $Per9Notes,  axis: .vertical)
        }
    }
}

struct WeekendView: View {
    var body: some View {
        Text(Date.now, format: .dateTime.day().month().year())
            .font(.footnote)
        Text("Today is weekend. No regularly scheduled school!")
            .padding()
            .font(.system(size: 15))
            .bold()
            .foregroundColor(.red)
            .multilineTextAlignment(.center)
    }
}

struct HolidayView: View {
    var body: some View {
        Group {
            Text(Date.now, format: .dateTime.day().month().year())
                .font(.footnote)
            Text("It's a holiday. No regularly scheduled school!")
                .padding()
                .font(.system(size: 15))
                .bold()
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
        }
        }
}


struct ContentView: View {
    @ObservedObject var xmlinfo = XMLInfo()
    var body: some View {
        MiddleSchoolSchedule(xmlinfo: xmlinfo)
        
    }
}

struct MiddleSchool_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
