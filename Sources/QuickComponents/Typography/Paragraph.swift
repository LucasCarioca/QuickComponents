//
//  Paragraph.swift
//  QuickComponents
//
//  Created by Lucas Desouza on 7/7/20.
//

import SwiftUI

/// Formats text to be used as a paragraph for a page or document.
public struct  paragraph: ViewModifier {
    var align:  TextAlignment
    var size: FontSize
    
    /// Initializes the paragraph format with custom size and alignment.
    /// - Parameters:
    ///   - align: set the positioning of the text. This can be one of the following  .leading .center or .trailing
    ///   - size: set the size of the text. This can be one of the following .LG .MD or .SM
    public init(align:  TextAlignment, size: FontSize){
        self.align = align
        self.size = size
    }
    
    public func body(content: Content) -> some View {
        HStack{
            self.align == .trailing || self.align == .center ? Spacer() : nil
            content.font(.system(size: self.size.rawValue)).multilineTextAlignment(self.align)
            self.align == .leading || self.align == .center ? Spacer() : nil
        }.padding()
    }
}

public extension View {
    /// Formats text to be used as a paragraph for a page or document.
    func Paragraph() -> some View {
        self.modifier(paragraph(align: .leading, size: .MD))
    }
    
    /// Formats text to be used as a paragraph for a page or document.
    /// - Parameter align: set the positioning of the text. This can be one of the following  .leading .center or .trailing
    func Paragraph(align: TextAlignment) -> some View {
        self.modifier(paragraph(align: align, size: .MD))
    }
    
    /// Formats text to be used as a paragraph for a page or document.
    /// - Parameters:
    ///   - align: set the positioning of the text. This can be one of the following  .leading .center or .trailing
    ///   - size: set the size of the text. This can be one of the following .LG .MD or .SM
    func Paragraph(align: TextAlignment, size: FontSize) -> some View {
        self.modifier(paragraph(align: align, size: size))
    }
    
    /// Formats text to be used as a paragraph for a page or document.
    /// - Parameter size: set the size of the text. This can be one of the following .LG .MD or .SM
    func Paragraph(size: FontSize) -> some View {
        self.modifier(paragraph(align: .leading, size: size))
    }
}

#if DEBUG
struct Paragraph_Align_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean cursus purus sapien, eget aliquet magna egestas porttitor. Proin elementum, nulla suscipit commodo congue, tellus tortor mollis felis, a congue ipsum ipsum et lacus. Suspendisse facilisis laoreet nibh, quis sodales libero ultricies vitae. Suspendisse convallis ultricies lorem, non blandit dolor semper vitae.").Paragraph()
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean cursus purus sapien, eget aliquet magna egestas porttitor. Proin elementum, nulla suscipit commodo congue, tellus tortor mollis felis, a congue ipsum ipsum et lacus. Suspendisse facilisis laoreet nibh, quis sodales libero ultricies vitae. Suspendisse convallis ultricies lorem, non blandit dolor semper vitae.").Paragraph(align: .center)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean cursus purus sapien, eget aliquet magna egestas porttitor. Proin elementum, nulla suscipit commodo congue, tellus tortor mollis felis, a congue ipsum ipsum et lacus. Suspendisse facilisis laoreet nibh, quis sodales libero ultricies vitae. Suspendisse convallis ultricies lorem, non blandit dolor semper vitae.").Paragraph(align: .trailing)
        }
    }
}

struct Paragraph_Size_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean cursus purus sapien, eget aliquet magna egestas porttitor. Proin elementum, nulla suscipit commodo congue, tellus tortor mollis felis, a congue ipsum ipsum et lacus. Suspendisse facilisis laoreet nibh, quis sodales libero ultricies vitae. Suspendisse convallis ultricies lorem, non blandit dolor semper vitae.").Paragraph(size: .LG)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean cursus purus sapien, eget aliquet magna egestas porttitor. Proin elementum, nulla suscipit commodo congue, tellus tortor mollis felis, a congue ipsum ipsum et lacus. Suspendisse facilisis laoreet nibh, quis sodales libero ultricies vitae. Suspendisse convallis ultricies lorem, non blandit dolor semper vitae.").Paragraph()
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean cursus purus sapien, eget aliquet magna egestas porttitor. Proin elementum, nulla suscipit commodo congue, tellus tortor mollis felis, a congue ipsum ipsum et lacus. Suspendisse facilisis laoreet nibh, quis sodales libero ultricies vitae. Suspendisse convallis ultricies lorem, non blandit dolor semper vitae.").Paragraph(size:.SM)
        }
    }
}

struct Paragraph_Example1_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean cursus purus sapien, eget aliquet magna egestas porttitor. Proin elementum, nulla suscipit commodo congue, tellus tortor mollis felis, a congue ipsum ipsum et lacus. Suspendisse facilisis laoreet nibh, quis sodales libero ultricies vitae. Suspendisse convallis ultricies lorem, non blandit dolor semper vitae.")
        }.Paragraph(align: .trailing)
    }
}
#endif
