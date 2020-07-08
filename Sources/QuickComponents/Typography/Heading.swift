//
//   Heading.swift
//   Components
//
//  Created by Lucas Desouza on 7/5/20.
//

import SwiftUI

public struct  heading: ViewModifier {
    var align:  TextAlignment
    var size:  HeadingSize

    public init(align:  TextAlignment, size:  HeadingSize){
        self.align = align
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

extension View {
    func Heading() -> some View {
        self.modifier(heading(align: .leading, size: .H1))
    }
    
    func Heading(align: TextAlignment) -> some View {
        self.modifier(heading(align: align, size: .H1))
    }
    
    func Heading(align: TextAlignment, size: HeadingSize) -> some View {
        self.modifier(heading(align: align, size: size))
    }
    
    func Heading(size: HeadingSize) -> some View {
        self.modifier(heading(align: .leading, size: size))
    }
}

#if DEBUG
struct  Heading_Previews_Align: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Alginment").Heading(align:.center)
            Text("leading").Heading()
            Text("center").Heading(align: .center)
            Text("trailing").Heading(align: .trailing)
        }
    }
}

struct  Heading_Previews_Size: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Heading Sizes").Heading(align:.center)
            Text("H1").Heading()
            Text("H2").Heading(size: .H2)
            Text("H3").Heading(size: .H3)
            Text("H4").Heading(size: .H4)
            Text("H5").Heading(size: .H5)
            Text("H6").Heading(size: .H6)
        }
    }
}
#endif
