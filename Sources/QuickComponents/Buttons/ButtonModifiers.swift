//
//  BasicButton.swift
//  QuickComponents
//
//  Created by Lucas Desouza on 5/27/20.
//

import SwiftUI

public protocol QuickButtonStyle: ButtonStyle {
    var variant: QuickButtonVariant { get set }
    init()
    init(variant: QuickButtonVariant)
}

/// Adds a primary style to a button with the primary color set.
public struct PrimaryButton: QuickButtonStyle {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    public var variant: QuickButtonVariant
    
    /// Adds a primary style to a button with the Empty variant by default.
    public init() {
        self.variant = .empty
    }
    
    /// Adds a primary style to a buttonwith the selected variant.
    /// - Parameter variant: Buttom variation to use (empty/contained/oulined)
    public init(variant: QuickButtonVariant) {
        self.variant = variant
    }
       
    public func makeBody(configuration: Configuration) -> some View {
        
        if variant == .contained {
            return GeometryReader { geometry in
                AnyView(configuration.label
                    .modifier(ContainedButton(baseColor: QuickColors.primaryAccent, accentColor: QuickColors.primary)))
            }
        }
        
        else if variant == .outlined {
            return GeometryReader { geometry in
                AnyView(configuration.label
                    .modifier(OutlinedButton(baseColor: QuickColors.primaryAccent   , accentColor: QuickColors.primary)))
            }
        }
        
        return GeometryReader { geometry in
            AnyView(configuration.label
                .modifier(EmptyButton(baseColor: QuickColors.primaryAccent, accentColor: QuickColors.primary)))
        }
        
    }
}

/// Adds a secondary style to a button with the secondary color set.
public struct SecondaryButton: QuickButtonStyle {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    public var variant: QuickButtonVariant
    
    /// Adds a secondary style to a buttonwith the empty variant by default.
    public init() {
        self.variant = .empty
    }
    
    /// Adds a secondary style to a button with the selected variant.
    /// - Parameter variant: Buttom variation to use (empty/contained/oulined)
    public init(variant: QuickButtonVariant) {
        self.variant = variant
    }
       
    public func makeBody(configuration: Configuration) -> some View {
        
        if variant == .contained {
            return GeometryReader { geometry in
                AnyView(configuration.label
                    .modifier(ContainedButton(baseColor: QuickColors.secondaryAccent, accentColor: QuickColors.secondary)))
            }
        }
        
        else if variant == .outlined {
            return GeometryReader { geometry in
                AnyView(configuration.label
                    .modifier(OutlinedButton(baseColor: QuickColors.secondaryAccent, accentColor: QuickColors.secondary)))
            }
        }
        
        return GeometryReader { geometry in
            AnyView(configuration.label
                .modifier(EmptyButton(baseColor: QuickColors.secondaryAccent, accentColor: QuickColors.secondary)))
        }
        
    }
}

/// Adds a disabled style to a button with the empty variant.
public struct DisabledButton: QuickButtonStyle {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    public var variant: QuickButtonVariant
    
    /// Adds a disabled style to a button with the empty variant by default.
    public init() {
        self.variant = .empty
    }
    
    /// Adds a disabled style to a button with the selected variant.
    /// - Parameter variant: Buttom variation to use (empty/contained/oulined)
    public init(variant: QuickButtonVariant) {
        self.variant = variant
    }
       
    public func makeBody(configuration: Configuration) -> some View {

        if variant == .contained {
            return GeometryReader { geometry in
                AnyView(configuration.label
                    .modifier(ContainedButton(baseColor: QuickColors.disabledAccent, accentColor: QuickColors.disabled)))
            }
        }
        
        else if variant == .outlined {
            return GeometryReader { geometry in
                AnyView(configuration.label
                    .modifier(OutlinedButton(baseColor: QuickColors.disabledAccent, accentColor: QuickColors.disabled)))
            }
        }
        
        return GeometryReader { geometry in
            AnyView(configuration.label
                .modifier(EmptyButton(baseColor: QuickColors.disabledAccent, accentColor: QuickColors.disabled)))
        }
        
    }
}


#if DEBUG
private struct ExampleButtons: View {
    
    @State var showingAlert = false
    var body: some View {
        VStack {
            
            HStack {
                Button(action: {}){
                    Text("Primary")
                }.buttonStyle(PrimaryButton())
                    .frame(width: 100, height: 50)
                Button(action: {}){
                   Text("Primary")
                }.buttonStyle(PrimaryButton(variant: .outlined))
                   .frame(width: 100, height: 50)
                Button(action: {}){
                    Text("Primary")
                }.buttonStyle(PrimaryButton(variant: .contained))
                    .frame(width: 100, height: 50)
            }
            
            HStack {
                Button(action: {}){
                    Text("Secondary")
                }.buttonStyle(SecondaryButton())
                    .frame(width: 100, height: 50)
                Button(action: {}){
                   Text("Secondary")
                }.buttonStyle(SecondaryButton(variant: .outlined))
                   .frame(width: 100, height: 50)
                Button(action: {}){
                    Text("Secondary")
                }.buttonStyle(SecondaryButton(variant: .contained))
                    .frame(width: 100, height: 50)
            }
            
            HStack {
                Button(action: {}){
                    Text("Disabled")
                }.buttonStyle(DisabledButton())
                    .frame(width: 100, height: 50)
                Button(action: {}){
                   Text("Disabled")
                }.buttonStyle(DisabledButton(variant: .outlined))
                   .frame(width: 100, height: 50)
                Button(action: {}){
                    Text("Disabled")
                }.buttonStyle(DisabledButton(variant: .contained))
                    .frame(width: 100, height: 50)
            }
            
        }
    }
}

struct BasicButton_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            Group{
                ExampleButtons()
            }
            Group{
                ExampleButtons().darkModeFix()
            }
        }
    }
}
#endif
