//
//  BarView.swift
//  QuickComponents
//
//  Created by Lucas Desouza on 5/25/20.
//

import SwiftUI
/**
# BarView
Creates a bar that show portion of full or complete. Example use case:  progress bar.
*/
public struct BarView: View {
    
    var value: CGFloat
    var max: CGFloat
    var overflowWarning = false
    var showLabel: Bool = false
    var color: Color = Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
    
    /// Sets the bar size and filled in volume.
    /// - Parameters:
    ///   - value: FIlled in volume of the bar
    ///   - max: Max volume of the bar
    public init(value: CGFloat, max: CGFloat){
        if value > max {
            self.value = max
            self.overflowWarning = true
        } else {
            self.value = value
        }
        self.max = max
    }
    
    /// Sets the bar size and filled in volume with option label and  custom color.
    /// - Parameters:
    ///   - value: FIlled in volume of the bar
    ///   - max: Max volume of the bar
    ///   - showLabel: Flag to show the volume of the bar currently filled. Set to nil or false to hide the label
    ///   - color: Color of the filled in bar. Set to nil to use the defaul.
    public init(value: CGFloat, max: CGFloat, showLabel: Bool?, color: Color?){
        self.value = value
        self.max = max
        if let showLabel = showLabel{
            self.showLabel = showLabel
        }
        if let color = color{
            self.color = color
        }
    }
    
    /// Builds the bar view with provided volume and max volume.
    public var body: some View {
        
        GeometryReader { geometry in
            ZStack (alignment: .leading) {
                Capsule().frame(width: geometry.size.width, height: 40).foregroundColor(Color.offWhite).shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                Capsule().frame(width: self.calcWidth(value: self.value, max: self.max, barWidth: geometry.size.width), height: 30).foregroundColor(self.color).padding(5).shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                HStack{
                    if self.showLabel {
                        Text(String(format: "%.2f", self.value)).padding()
                    }
                    Spacer()
                    if self.overflowWarning {
                        ZStack{
                            Circle().frame(width: 25, height:25).foregroundColor(.red)
                            Text("!")
                        }.Paragraph(align: .trailing, size: .LG).foregroundColor(.white)
                        
                    }
                }
            }
        }
    }
    private func calcWidth(value: CGFloat, max: CGFloat, barWidth: CGFloat) -> CGFloat {
        return ((barWidth - 10) * value) / max
    }
}

#if DEBUG
struct BarView_Previews_neumorphism: PreviewProvider {
    
    static var previews: some View {
        ZStack {
            Color.offWhite.edgesIgnoringSafeArea(.all)
            VStack {
                BarView(value: 22, max: 30)
                BarView(value: 35, max: 30)
                BarView(value: 30, max: 30)
                BarView(value: 22, max: 30, showLabel: nil, color: .green)
                BarView(value: 22, max: 30, showLabel: true, color: nil)
                BarView(value: 22, max: 30, showLabel: true, color: .red)
            }
        }
    }
}

struct BarView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            BarView(value: 22, max: 30)
            BarView(value: 35, max: 30)
            BarView(value: 30, max: 30)
            BarView(value: 22, max: 30, showLabel: nil, color: .green)
            BarView(value: 22, max: 30, showLabel: true, color: nil)
            BarView(value: 22, max: 30, showLabel: true, color: .red)
        }.darkModeFix()
    }
}
#endif
