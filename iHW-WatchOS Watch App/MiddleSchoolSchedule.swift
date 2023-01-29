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
    var body: some View {
        NavigationStack {
            VStack (spacing: -5) {
                
                Text("\(DayDateLong)")
                    .font(.footnote)
                Text("Today is an \(SchoolDayDescription)")
                    .padding()
                    .font(.system(size: 15))
                    .bold()
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
               
                
                
                
                List {
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
                        Text("Period 5")
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
