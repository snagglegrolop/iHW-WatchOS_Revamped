//
//  TestView.swift
//  iHW-WatchOS Watch App
//
//  Created by Zachary Abrahamson  on 1/30/23.
//
import SwiftUI
import Foundation






/*
struct ContentTest: View {
    @ObservedObject var xmlinfo: XMLInfo
    var body: some View {
        // Get the current date
        let currentDate = Date()
        
        // Define the number of days to add
        let xDays = xmlinfo.MScounter
        
        // Define a date formatter to output the day of the week
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        // Calculate the date of x days in the future
        if let futureDate = Calendar.current.date(byAdding: .day, value: xDays, to: currentDate) {
            // Output the day of the week for the future date
            let dayOfWeek = dateFormatter.string(from: futureDate)
            
            // Display the future date in a Text view
            return Text("In \(xDays) days, it will be a \(dayOfWeek).")
        }
        
        // If the future date couldn't be calculated, return an empty Text view
        return Text("")
    }
}
*/

struct FluidStepView: View {
    @ObservedObject var xmlinfo = XMLInfo()
    // - Properties -
    @State private(set) var value: Int = 0
    
    // - Body -
    var body: some View {
        ZStack {
                Color.screenBackground.edgesIgnoringSafeArea(.all)
                FluidStepper(xmlinfo: xmlinfo)
                
            
        }
    }
}


struct FluidStepper: View {
    @ObservedObject var xmlinfo: XMLInfo
    //Properties
    var width: CGFloat = 250
    var minValue: Int  = 0
    var maxValue: Int  = 100
    
    @State private(set) var labelOffset: CGSize      = .zero
    @State private(set) var dragDirection: Direction = .none

    var body: some View {
        ZStack {
            ControlSegmentView()
                .animation(springAnimation, value: controlsContainerOffset)
            
            LabelView()
                .animation(springAnimation, value: labelOffset)
                .highPriorityGesture (
                    DragGesture()
                        .onChanged { value in
                            updateDragLocation(with: value.translation)
                            updateOffset(with: value)
                        }
                        .onEnded { _ in self.updateStepperValue() }
                    )
        }
    }
}

struct Arrow: Shape {
    var startAngle1: Angle
    var endAngle1: Angle
    var clockwise: Bool
    var spacing: Double
    var startAngle2: Angle
    var endAngle2: Angle
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle1 - rotationAdjustment
        let modifiedEnd = endAngle1 - rotationAdjustment
        let modifyingStart = startAngle2 - rotationAdjustment
        let modifyingEnd = endAngle2 - rotationAdjustment

        var path = Path()
        
        //below top nose
        path.move(to: CGPoint(x: rect.maxX - spacing * 1.2, y: rect.midY - spacing + 3.0))
        
        // top nose
        path.addArc(center: CGPoint(x: rect.midX + spacing * 1.3, y: rect.minY + 1), radius: rect.width / 9.8, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        //mid-nose
        path.addArc(center: CGPoint(x: rect.maxX + spacing + 1, y: rect.midY), radius: rect.width / 9.6, startAngle: .degrees(320), endAngle: .degrees(50), clockwise: !clockwise)

        //bottom nose
        path.addArc(center: CGPoint(x: rect.midX + spacing * 1.3, y: rect.maxY - 1), radius: rect.width / 9.8, startAngle: modifyingStart, endAngle: modifyingEnd, clockwise: !clockwise)
        
        path.addLine(to: CGPoint(x: rect.maxX - spacing * 1.2, y: rect.midY + spacing - 0.5))
        
        path.addLine(to: CGPoint(x: rect.midX + spacing * 2, y: rect.midY + spacing * 1.05))

        path.addArc(center: CGPoint(x: rect.minX - spacing * 1.15, y: rect.midY), radius: rect.width / 9.8, startAngle: .degrees(95), endAngle: .degrees(275), clockwise: !clockwise)
        
        path.addLine(to: CGPoint(x: rect.midX + spacing * 2, y: rect.midY - spacing * 1.05))
        
        path.addLine(to: CGPoint(x: rect.maxX - spacing * 1.2, y: rect.midY - spacing + 0.5))
        
      


        return path
    }
}

//MARK: - Views -
private extension FluidStepper {
    private func ControlSegmentView() -> some View {
        HStack(spacing: spacing) {
            ControlButton(
                systemName: "arrow.left",
                size: controlFrameSize,
                isActive: dragDirection == .left,
                opacity: leftControlOpacity,
                action: decrease
                
            )
            
            ControlButton(
                systemName: "xmark",
                size: controlFrameSize,
                isActive: dragDirection == .down,
                opacity: controlsOpacity
            )
            .allowsHitTesting(false)
            
            ControlButton(
                systemName: "arrow.right",
                size: controlFrameSize,
                isActive: dragDirection == .right,
                opacity: rightControlOpacity,
                action: increase
            )
            
        }
        .padding(.horizontal, spacing)
        .background(
            RoundedRectangle(cornerRadius: controlsContainerCornerRadius)
                .fill(Color.controlBackground)
                .overlay(
                    Color.black.opacity(controlsContainerOpacity)
                        .clipShape(RoundedRectangle(cornerRadius: controlsContainerCornerRadius))
                )
                .frame(width: width, height: controlsContainerHeigth)
        )
        .offset(controlsContainerOffset)
    }
    
    private func LabelView() -> some View {
        ZStack {
            Circle()
                .fill(Color.labelBackground)
                .frame(width: labelSize, height: labelSize)
            
            Text("\(xmlinfo.MScounter)")
                .foregroundColor(.white)
                .font(.system(size: labelFontSize, weight: .semibold, design: .rounded))
        }
        .drawingGroup()
        .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 5)
        .contentShape(Circle())
        .onTapGesture { xmlinfo.MScounter += 1
            xmlinfo.MSgetInfo(futuredays: xmlinfo.MScounter)
        }
        .offset(self.labelOffset)
    }
}

//MARK: - Methods -
private extension FluidStepper {
    private func updateDragLocation(with translation: CGSize) {
        withAnimation {
//            print(translation.height)
            if translation.height <= 0 {
                if translation.width > 10 {
                    self.dragDirection = .right
                } else if translation.width < 10 {
                    self.dragDirection = .left
                }
            } else if self.dragDirection == .none {
                self.dragDirection = .down
            }
        }
    }
    
    private func updateOffset(with value : DragGesture.Value) {
        var newWidth: CGFloat = 0
        
        if value.translation.width > 0 {
            newWidth = min(value.translation.width * 0.75,
                           width / 2 - (labelSize / 2) )
        } else if value.translation.width < 0 {
            newWidth = max((value.translation.width * 0.75), -((width / 2) - (labelSize / 2)))
        }
        
        let newHeight = min(value.translation.height * 0.75, (controlsContainerHeigth * 0.8))
        
        withAnimation {
            self.labelOffset = .init(
                width: self.dragDirection  == .down ? 0 : newWidth,
                height: self.dragDirection == .down ? newHeight : 0
            )
        }
    }
    
    private func updateStepperValue() {
        switch dragDirection {
        case .none:
            break
        case .left:
            self.decrease()
        case .right:
            self.increase()
        case .down:
            self.reset()
        }
        
        withAnimation {
            self.labelOffset = .zero
            self.dragDirection = .none
        }
    }
}

//MARK: - Operations
private extension FluidStepper {
    
    private func decrease() {
        if xmlinfo.MScounter != minValue { xmlinfo.MScounter -= 1
            xmlinfo.MSgetInfo(futuredays: xmlinfo.MScounter)
        }
    }
    
    private func increase() {
        if xmlinfo.MScounter < maxValue { xmlinfo.MScounter += 1
            xmlinfo.MSgetInfo(futuredays: xmlinfo.MScounter)
        }
    }
    
    private func reset() { xmlinfo.MScounter = 0
        xmlinfo.MSgetInfo(futuredays: xmlinfo.MScounter)
    }
}

// MARK: Enum `Direction`
extension FluidStepper {
    enum Direction { case none, left, right, down }
}

extension FluidStepper {
    var springAnimation: Animation { .interpolatingSpring(stiffness: 350, damping: 15) }
}

extension FluidStepper {
    var defaultControlsOpacity: Double { 0.4 }
    var spacing: CGFloat { width / 225 }
    
    var controlsContainerHeigth: CGFloat { width / 2.5 }
    var controlsContainerCornerRadius: CGFloat { width / 4.9 }
    var controlsContainerOffset: CGSize {
        .init(
            width:  labelOffset.width / 6,
            height: labelOffset.height / 6
        )
    }
    var controlsContainerOpacity: Double { controlsOpacity * 0.2 + abs(labelOffsetXInPercents) * 0.25 }
    var controlsOpacity: Double { labelOffsetYInPercents }
    
    var controlFrameSize: CGFloat { width / 4.2 }
    
    var leftControlOpacity: Double {
        if labelOffset.width < 0 {
            return -Double(labelOffset.width / (labelOffsetXLimit * 0.65)) + defaultControlsOpacity
        } else {
            return defaultControlsOpacity - controlsOpacity - labelOffsetXInPercents / 3.5
        }
    }
    var rightControlOpacity: Double {
        if labelOffset.width > 0 {
            return Double(labelOffset.width / (labelOffsetXLimit * 0.65)) + defaultControlsOpacity
        } else {
            return defaultControlsOpacity - controlsOpacity + labelOffsetXInPercents / 3.5
        }
    }
    
    var labelSize: CGFloat { width / 6 }
    var labelFontSize: CGFloat { labelSize / 1.0 }
    var labelOffsetXLimit: CGFloat { width / 3 + spacing}
    var labelOffsetYLimit: CGFloat { controlsContainerHeigth / 1.2 }
    var labelOffsetXInPercents: Double { Double(labelOffset.width / labelOffsetXLimit) }
    var labelOffsetYInPercents: Double { Double(labelOffset.height / labelOffsetYLimit) }
}

extension Color {
    static let screenBackground: Color   = .clear
    static let controlBackground: Color  = .clear
    static let labelBackground: Color    = .clear
    static let control: Color            = .clear
}

struct ControlButton: View {
    var systemName: String
    var size: CGFloat
    var isActive: Bool
    var opacity: Double
    var action: () -> Void = {}
    
    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(size / 3.5)
                .frame(width: size, height: size)
                .foregroundColor(Color.white.opacity(opacity))
                
        }
        .buttonStyle(ControlButtonStyle(systemName: systemName, size: size))
        .contentShape(Circle())
    }
}


// MARK: - Control ButtonStyle -
struct ControlButtonStyle: ButtonStyle {
    var systemName: String
    var size: CGFloat
    var padding: CGFloat
    
    init(systemName: String, size: CGFloat) {
        self.systemName = systemName
        self.size = size
        self.padding = size / 3.5
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .overlay(
                ZStack {
                    Image(systemName: systemName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(padding)
                        .foregroundColor(.controlBackground)
                }
                .frame(width: size, height: size)
                .opacity(configuration.isPressed ? 1 : 0)
                .animation(.linear(duration: 0.1), value: configuration.isPressed)
            )
            .font(.system(size: 60, weight: .heavy, design: .rounded))
            .scaleEffect(configuration.isPressed ? 0.85 : 1)
        }
}

struct FluidStepper_Previews: PreviewProvider {
    static var previews: some View {
        FluidStepView()
    }
}
