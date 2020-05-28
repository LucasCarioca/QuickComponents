//
//  BasicButton.swift
//  QuickComponents
//
//  Created by Lucas Desouza on 5/27/20.
//

import SwiftUI

typealias MethodHandler = ()  -> Void

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

public struct QuickColors {
    static var primary: UIColor = #colorLiteral(red: 0.07846928388, green: 0.5040031075, blue: 0.8973124623, alpha: 1)
    static var primaryAccent: UIColor = #colorLiteral(red: 0.9522330165, green: 0.946572125, blue: 0.9565842748, alpha: 1)
    static var disabled: UIColor = #colorLiteral(red: 0.8783541918, green: 0.8784809113, blue: 0.8783264756, alpha: 1)
    static var disabledAccent: UIColor = #colorLiteral(red: 0.1137114838, green: 0.1137344316, blue: 0.1137065664, alpha: 1)
    static var secondary: UIColor = #colorLiteral(red: 0.9630364776, green: 0.003629619256, blue: 0.357791841, alpha: 1)
    static var secondaryAccent: UIColor = #colorLiteral(red: 0.9502020478, green: 0.9445533752, blue: 0.954544127, alpha: 1)
    static var primaryDarkMode: UIColor = #colorLiteral(red: 0.5525570512, green: 0.7790964246, blue: 0.9619663358, alpha: 1)
    static var primaryAccentDarkMode: UIColor = #colorLiteral(red: 0.07319676131, green: 0.1023326293, blue: 0.1279197633, alpha: 1)
    static var disabledDarkMode: UIColor = #colorLiteral(red: 0.8783541918, green: 0.8784809113, blue: 0.8783264756, alpha: 1)
    static var disabledAccentDarkMode: UIColor = #colorLiteral(red: 0.1137114838, green: 0.1137344316, blue: 0.1137065664, alpha: 1)
    static var secondaryDarkMode: UIColor = #colorLiteral(red: 0.9584334493, green: 0.5590918064, blue: 0.6929282546, alpha: 1)
    static var secondaryAccentDarkMode: UIColor = #colorLiteral(red: 0.1252025068, green: 0.07195176929, blue: 0.09073419124, alpha: 1)
}

public struct PrimaryButton: QuickButtonStyle {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    public var variant: QuickButtonVariant
    
    public init() {
        self.variant = .empty
    }

    public init(variant: QuickButtonVariant) {
        self.variant = variant
    }
       
    public func makeBody(configuration: Configuration) -> some View {
        let foreColor = colorScheme == .dark ? QuickColors.primaryAccentDarkMode : QuickColors.primaryAccent
        let backColor = colorScheme == .dark ? QuickColors.primaryDarkMode : QuickColors.primary
        
        if variant == .contained {
            return GeometryReader { geometry in
                AnyView(configuration.label
                    .modifier(ContainedButton(baseColor: foreColor, accentColor: backColor)))
            }
        }
        
        else if variant == .outlined {
            return GeometryReader { geometry in
                AnyView(configuration.label
                    .modifier(OutlinedButton(baseColor: foreColor, accentColor: backColor)))
            }
        }
        
        return GeometryReader { geometry in
            AnyView(configuration.label
                .modifier(EmptyButton(baseColor: foreColor, accentColor: backColor)))
        }
        
    }
}

public struct SecondaryButton: QuickButtonStyle {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    public var variant: QuickButtonVariant
    
    public init() {
        self.variant = .empty
    }

    public init(variant: QuickButtonVariant) {
        self.variant = variant
    }
       
    public func makeBody(configuration: Configuration) -> some View {
        let foreColor = colorScheme == .dark ? QuickColors.secondaryAccentDarkMode : QuickColors.secondaryAccent
        let backColor = colorScheme == .dark ? QuickColors.secondaryDarkMode : QuickColors.secondary
        
        if variant == .contained {
            return GeometryReader { geometry in
                AnyView(configuration.label
                    .modifier(ContainedButton(baseColor: foreColor, accentColor: backColor)))
            }
        }
        
        else if variant == .outlined {
            return GeometryReader { geometry in
                AnyView(configuration.label
                    .modifier(OutlinedButton(baseColor: foreColor, accentColor: backColor)))
            }
        }
        
        return GeometryReader { geometry in
            AnyView(configuration.label
                .modifier(EmptyButton(baseColor: foreColor, accentColor: backColor)))
        }
        
    }
}

public struct DisabledButton: QuickButtonStyle {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    public var variant: QuickButtonVariant
    
    public init() {
        self.variant = .empty
    }

    public init(variant: QuickButtonVariant) {
        self.variant = variant
    }
       
    public func makeBody(configuration: Configuration) -> some View {
        let foreColor = colorScheme == .dark ? QuickColors.disabledAccentDarkMode : QuickColors.disabledAccent
        let backColor = colorScheme == .dark ? QuickColors.disabledDarkMode : QuickColors.disabled
        
        if variant == .contained {
            return GeometryReader { geometry in
                AnyView(configuration.label
                    .modifier(ContainedButton(baseColor: foreColor, accentColor: backColor)))
            }
        }
        
        else if variant == .outlined {
            return GeometryReader { geometry in
                AnyView(configuration.label
                    .modifier(OutlinedButton(baseColor: foreColor, accentColor: backColor)))
            }
        }
        
        return GeometryReader { geometry in
            AnyView(configuration.label
                .modifier(EmptyButton(baseColor: foreColor, accentColor: backColor)))
        }
        
    }
}

public protocol QuickButtonStyle: ButtonStyle {
    var variant: QuickButtonVariant { get set }
    init()
    init(variant: QuickButtonVariant)
}

public enum QuickButtonVariant {
    case contained
    case outlined
    case empty
}

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


public struct DarkView<Content> : View where Content : View {
    var darkContent: Content
    var on: Bool
    public init(_ on: Bool, @ViewBuilder content: () -> Content) {
        self.darkContent = content()
        self.on = on
    }

    public var body: some View {
        ZStack {
            if on {
                Spacer()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color.black)
                    .edgesIgnoringSafeArea(.all)
                darkContent.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).background(Color.black).colorScheme(.dark)
            } else {
                darkContent
            }
        }
    }
}

extension View {
    public func darkModeFix(_ on: Bool = true) -> DarkView<Self> {
        DarkView(on) {
            self
        }
    }
}
