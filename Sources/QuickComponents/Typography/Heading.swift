//
//   Heading.swift
//   Components
//
//  Created by Lucas Desouza on 7/5/20.
//

import SwiftUI

/// Formats text to be used as a heading for a page or document.
public struct  heading: ViewModifier {
    var align:  TextAlignment
    var size:  HeadingSize
    
    /// Initializes the heading format with a custom size and alignment
    /// - Parameters:
    ///   - align: set the positioning of the text. This can be one of the following  .leading .center or .trailing
    ///   - size: set the size of the text. This follows HTML Like sizing names. ex. H1 H2 H3 H4 H5 H6 where H1 is the largest and H6 is the smallest.
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

public extension View {
    /// Formats text to be used as a heading for a page or document.
    func Heading() -> some View {
        self.modifier(heading(align: .leading, size: .H1))
    }
    
    /// Formats text to be used as a heading for a page or document.
    /// - Parameter align: set the positioning of the text. This can be one of the following  .leading .center or .trailing
    func Heading(align: TextAlignment) -> some View {
        self.modifier(heading(align: align, size: .H1))
    }
    
    /// Formats text to be used as a heading for a page or document.
    /// - Parameters:
    ///   - align: set the positioning of the text. This can be one of the following  .leading .center or .trailing
    ///   - size: set the size of the text. This follows HTML Like sizing names. ex. H1 H2 H3 H4 H5 H6 where H1 is the largest and H6 is the smallest.
    func Heading(align: TextAlignment, size: HeadingSize) -> some View {
        self.modifier(heading(align: align, size: size))
    }
    
    /// Formats text to be used as a heading for a page or document.
    /// - Parameter size: set the size of the text. This follows HTML Like sizing names. ex. H1 H2 H3 H4 H5 H6 where H1 is the largest and H6 is the smallest.
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
