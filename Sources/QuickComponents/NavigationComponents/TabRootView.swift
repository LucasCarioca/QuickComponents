//
//  TabRootView.swift
//  QuickComponents
//
//  Created by Lucas Desouza on 8/6/20.
//

import SwiftUI

///  A TabPage contains both a View and a SF Symbols image name. This is used to create a Tabbed view where the image is the icon for the tab and the view is the content shown when the tab is selected.
public struct TabPage {
    var image: String
    var view: AnyView
    
    /// Cteates TabPage with a SF Symbol image and View.
    /// - Parameters:
    ///   - image: SF Symbol name for the image that will appear on the tab
    ///   - view: Content to be shown when the tab is selected
    public init<V>(image: String, view: V) where V : View {
        self.image = image
        self.view = AnyView(view)
    }
}

/// Creates the root of a tabbed view.
struct TabRootView: View {
    @State var tag = 0
    var tabs: [TabPage]
    var theme: TabViewTheme
    
    /// Creates a TabRootView with the provided TabPages and custom theme
    /// - Parameters:
    ///   - tabs: Tabs to include in the tabbed view
    ///   - theme: Cusom theme for the tabbed view
    init(tabs: [TabPage], theme: TabViewTheme = TabViewTheme(backgroundColor: Color.clear, highlightColor: .blue, defaultColor: .gray)) {
        self.tabs = tabs
        self.theme = theme
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                self.theme.backgroundColor.edgesIgnoringSafeArea(.all)
                VStack {
                    self.tabs[self.tag].view.frame(width: geometry.size.width, height: geometry.size.height-75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    ZStack {
                        HStack {
                            ForEach(0..<self.tabs.count) { i in
                                Image(systemName: self.tabs[i].image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(20)
                                    .frame(width: geometry.size.width / CGFloat(self.tabs.count), height: 75)
                                    .foregroundColor(self.tag == i ? self.theme.highlightColor : self.theme.defaultColor)
                                .onTapGesture {
                                    withAnimation{
                                        self.tag = i
                                    }
                                }
                            }
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height / 10).padding(.bottom)
                    }
                }.edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

/// Custom theme for TabRootView
public class TabViewTheme {
    public var backgroundColor: Color
    public var highlightColor: Color
    public var defaultColor: Color
    
    /// Custom theme for TabRootView with SwiftUI Color
    /// - Parameters:
    ///   - backgroundColor: Set the background of the bottom tab bar
    ///   - highlightColor: Set the color for the highlight on the selected tab
    ///   - defaultColor: Set the color for non-selected tabs
    init(backgroundColor: Color, highlightColor: Color, defaultColor: Color) {
        self.backgroundColor = backgroundColor
        self.highlightColor = highlightColor
        self.defaultColor = defaultColor
    }
    
    /// Custom theme for TabRootView with  UIColor
    /// - Parameters:
    ///   - backgroundColor: Set the background of the bottom tab bar
    ///   - highlightColor: Set the color for the highlight on the selected tab
    ///   - defaultColor: Set the color for non-selected tabs
    init(backgroundColor: UIColor, highlightColor: UIColor, defaultColor: UIColor) {
        self.backgroundColor = Color(backgroundColor)
        self.highlightColor = Color(highlightColor)
        self.defaultColor = Color(defaultColor)
    }
}

struct TabRootView_Previews: PreviewProvider {
    static var previews: some View {
        TabRootView(tabs: [
            TabPage(image: "timer", view: Text("one")),
            TabPage(image: "timer", view: Text("Two")),
            TabPage(image: "timer", view: Text("Three")),
            
        ])
    }
}

struct TabRootViewTheme_Previews: PreviewProvider {
    static var previews: some View {
        TabRootView(tabs: [
            TabPage(image: "timer", view: Text("one")),
            TabPage(image: "timer", view: Text("Two"))
        ], theme: TabViewTheme(backgroundColor: .darkGray, highlightColor: .white, defaultColor: .gray))
    }
}
