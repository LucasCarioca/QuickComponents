//
//  ButtonVariantModifiers.swift
//  QuickComponents
//
//  Created by Lucas Desouza on 5/29/20.
//

import Foundation
import SwiftUI

/// Enum for the different variations of buttons available.
public enum QuickButtonVariant {
    case contained
    case outlined
    case empty
}

/// Creates a button that is filled in and colored.
public struct ContainedButton: ViewModifier {
    var baseColor: UIColor
    var accentColor: UIColor
    public func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .frame(width: geometry.size.width, height: geometry.size.height)
                .border(Color(self.accentColor), width: 5)
                .background(Color(self.accentColor))
                .foregroundColor(Color(self.baseColor))
            .cornerRadius(5)
        }
    }
}

/// Creates  a button that has a colored border but not filled in.
public struct OutlinedButton: ViewModifier {
    var baseColor: UIColor
    var accentColor: UIColor
    public func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .frame(width: geometry.size.width, height: geometry.size.height)
                .border(Color(self.accentColor), width: 3)
                .foregroundColor(Color(self.accentColor))
            .cornerRadius(5)
        }
    }
}

/// Creates a button that only shows the text without a border of fill color.
public struct EmptyButton: ViewModifier {
    var baseColor: UIColor
    var accentColor: UIColor
    public func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .frame(width: geometry.size.width, height: geometry.size.height)
                .foregroundColor(Color(self.accentColor))
            .cornerRadius(5)
        }
    }
}
