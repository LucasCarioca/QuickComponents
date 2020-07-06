//
//  QuickHeading.swift
//  QuickComponents
//
//  Created by Lucas Desouza on 7/5/20.
//

import SwiftUI

public enum QuickAlignment {
    case leading
    case center
    case trailing
}

public enum QuickHeadingSize: CGFloat {
    case H1 = 50
    case H2 = 45
    case H3 = 40
    case H4 = 35
    case H5 = 30
    case H6 = 25
}

public struct QuickHeading: ViewModifier {
    var align: QuickAlignment
    var size: QuickHeadingSize
    
    public init(align: QuickAlignment){
        self.align = align
        self.size = .H1
    }
    
    public init(align: QuickAlignment, size: QuickHeadingSize){
        self.align = align
        self.size = size
    }
    
    public init() {
        self.align = .leading
        self.size = .H1
    }
    
    public init(size: QuickHeadingSize) {
        self.align = .leading
        self.size = size
    }
    
    public func body(content: Content) -> some View {
        HStack{
            self.align == .trailing || self.align == .center ? Spacer() : nil
            content.font(.system(size: self.size.rawValue))
            self.align == .leading || self.align == .center ? Spacer() : nil
        }.padding()
    }
}


struct QuickHeading_Previews_Align: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Alginment").modifier(QuickHeading(align:.center))
            Text("leading").modifier(QuickHeading())
            Text("center").modifier(QuickHeading(align: .center))
            Text("trailing").modifier(QuickHeading(align: .trailing))
        }
    }
}

struct QuickHeading_Previews_Size: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Heading Sizes").modifier(QuickHeading(align:.center))
            Text("H1").modifier(QuickHeading())
            Text("H2").modifier(QuickHeading(size: .H2))
            Text("H3").modifier(QuickHeading(size: .H3))
            Text("H4").modifier(QuickHeading(size: .H4))
            Text("H5").modifier(QuickHeading(size: .H5))
            Text("H6").modifier(QuickHeading(size: .H6))
        }
    }
}
