//
//  BarView.swift
//  QuickComponents
//
//  Created by Lucas Desouza on 5/25/20.
//

import SwiftUI

/// # BarView
/// Creates a bar that show portion of full or complete. Example use case is a percent complete bar.
///
/// **Example progress bar**
/// ```swift
/// struct ProgressView: View {
///     @State var timePublisher = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
///     @State var counter: CGFloat = 0
///     var body: some View{
///         BarView(value: self.counter, max: 30).onReceive(self.timePublisher) { time in
///             if (self.counter < 30) {
///                 self.counter += 1
///             }
///         }
///     }
/// }
/// ```
public struct BarView: View {
    
    var value: CGFloat
    var max: CGFloat
    var showLabel: Bool = false
    var color: Color = Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
    
    /// Sets the bar size and filled in volume.
    /// - Parameters:
    ///   - value: **CGFloat** FIlled in volume of the bar
    ///   - max: **CGFload** Max volume of the bar
    public init(value: CGFloat, max: CGFloat){
        self.value = value
        self.max = max
    }
    
    /// Sets the bar size and filled in volume with option label and  custom color.
    /// - Parameters:
    ///   - value: **CGFloat** FIlled in volume of the bar
    ///   - max: **CGFload** Max volume of the bar
    ///   - showLabel: **Bool?** Flag to show the volume of the bar currently filled. Set to nil or false to hide the label
    ///   - color: **Color?** Color of the filled in bar. Set to nil to use the defaul.
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
                Capsule().frame(width: geometry.size.width, height: 40).foregroundColor(Color(#colorLiteral(red: 0.8444244862, green: 0.8742135763, blue: 0.8439202309, alpha: 1))).shadow(radius: 5)
                Capsule().frame(width: self.calcWidth(value: self.value, max: self.max, barWidth: geometry.size.width), height: 30).foregroundColor(self.color).padding(5).shadow(radius: 5)
                if self.showLabel {
                    Text(String(format: "%.2f", self.value)).padding()
                }
            }
        }
    }
    private func calcWidth(value: CGFloat, max: CGFloat, barWidth: CGFloat) -> CGFloat {
        return ((barWidth - 10) * value) / max
    }
}

#if DEBUG
private struct ProgressView: View {
    @State var timePublisher = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var counter: CGFloat = 0
    var body: some View{
        BarView(value: self.counter, max: 5).onReceive(self.timePublisher) { time in
            if (self.counter < 5) {
                self.counter += 1
            }
        }
    }
}


struct BarView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group{
            Group {
                ProgressView()
            }
            Group {
                BarView(value: 22, max: 30)
            }
            Group {
                BarView(value: 30, max: 30)
            }
            Group {
                BarView(value: 22, max: 30, showLabel: nil, color: .orange)
            }
            Group {
                BarView(value: 22, max: 30, showLabel: true, color: nil)
            }
            Group {
                BarView(value: 22, max: 30, showLabel: true, color: .red)
            }
        }
    }
}
#endif
