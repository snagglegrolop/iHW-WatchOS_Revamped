//
//  CacheBar.swift
//  iHW-WatchOS Watch App
//
//  Created by Zachary Abrahamson  on 2/28/23.
//

import SwiftUI


var secondaryColor: Color = Color(.white)



class SGConvenience{
    #if os(watchOS)
    static var deviceWidth:CGFloat = WKInterfaceDevice.current().screenBounds.size.width
    #elseif os(iOS)
    static var deviceWidth:CGFloat = UIScreen.main.bounds.size.width
    #elseif os(macOS)
    static var deviceWidth:CGFloat? = NSScreen.main?.visibleFrame.size.width // You could implement this to force a CGFloat and get the full device screen size width regardless of the window size with .frame.size.width
    #endif
}


struct SideMenu: View {
    @Binding var isSidebarVisible: Bool
    var sideBarWidth = SGConvenience.deviceWidth * 0.6
    var menuColor: Color = Color(.init(red: 196 / 255, green: 2 / 255, blue: 51 / 255, alpha: 1))
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
                
            }
            .background(.black.opacity(0.6))
            .opacity(isSidebarVisible ? 1 : 0)
            .animation(.easeInOut.delay(0.2), value: isSidebarVisible)
            .onTapGesture {
                isSidebarVisible.toggle()
            }
            content
            
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    var content: some View {
        HStack(alignment: .top) {
            ZStack(alignment: .top) {
                menuColor
                MenuChevron
                .padding(.top, 80)
                .padding(.horizontal, 40)
                
                
                VStack {
                    Button {
                        URLCache.shared.removeAllCachedResponses()
                    } label: {
                        Text("Reset The Cache")
                        
                    }
                    .padding(.top, 400.0)
                    Text("Click only if the app is showing incorrect information. If the issue persists, let a dev know.")
                        .font(.system(size: 15, weight: .semibold))
                        .padding(.top, 100)
                }
            }
            
            .frame(width: sideBarWidth)
            .offset(x: isSidebarVisible ? 0 : -sideBarWidth)
            .animation(.default, value: isSidebarVisible)
            Spacer()
        }
    }
    
    var MenuChevron: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(menuColor)
                .frame(width: 60, height: 60)
                .rotationEffect(Angle(degrees: 45))
                .offset(x: isSidebarVisible ? -18 : -10)
                .onTapGesture {
                    isSidebarVisible.toggle()
                }
            
            Image(systemName: "chevron.right")
                .foregroundColor(secondaryColor)
                .rotationEffect(isSidebarVisible ? Angle(degrees: 180) : Angle(degrees: 0))
                .offset(x: isSidebarVisible ? -4 : 8)
                .foregroundColor(.blue)
        }
        .offset(x: sideBarWidth / 2, y: 80)
        .animation(.default, value: isSidebarVisible)
    }
}







struct ContentView: View {
    let messages: [String]

    var body: some View {
        List(messages, id: \.self) { message in
            Text(message)
        }
        .navigationTitle("Messages")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("New") {}
            }

         
            }
        
    }
}


struct Homepge_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(messages: ["howdy"])
        }
    }
