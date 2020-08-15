//
//  TabRootView.swift
//  QuickComponents
//
//  Created by Lucas Desouza on 8/6/20.
//

import SwiftUI

public struct TabPage {
    var image: String
    var view: AnyView
    
    public init<V>(image: String, view: V) where V : View {
        self.image = image
        self.view = AnyView(view)
    }
}

struct TabRootView: View {
    @State var tag = 0
    var tabs: [TabPage]
    var theme: TabViewTheme
    
    init(tabs: [TabPage]) {
        self.tabs = tabs
        self.theme = TabViewTheme(backgroundColor: Color.clear, highlightColor: .blue, defaultColor: .gray)
    }
    
    init(tabs: [TabPage], theme: TabViewTheme) {
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

public class TabViewTheme {
    public var backgroundColor: Color
    public var highlightColor: Color
    public var defaultColor: Color
    
    init(backgroundColor: Color, highlightColor: Color, defaultColor: Color) {
        self.backgroundColor = backgroundColor
        self.highlightColor = highlightColor
        self.defaultColor = defaultColor
    }
    
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
            TabPage(image: "lungs", view: Text("Two")),
            TabPage(image: "lungs", view: Text("Two")),
            TabPage(image: "lungs", view: Text("Two")),
        ])
    }
}

struct TabRootViewTheme_Previews: PreviewProvider {
    static var previews: some View {
        TabRootView(tabs: [
            TabPage(image: "timer", view: Text("one")),
            TabPage(image: "lungs", view: Text("Two"))
        ], theme: TabViewTheme(backgroundColor: .darkGray, highlightColor: .white, defaultColor: .gray))
    }
}
