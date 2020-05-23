//
//  SwiftUIView.swift
//  QuickComponents
//
//  Created by Lucas Desouza on 5/23/20.
//

import SwiftUI


/**
 # SwitcherPage
 
 Used to define a page for SwitcherView.
 
 ## Example
 ```swift
 SwitcherPage(label: "One", view: Text("Hello World!")),
 ```
 */
public struct SwitcherPage {
    var label: String
    var view: AnyView
    
    /// - Parameters:
    ///   - label: `String` for page in switcher button title
    ///   - view: `View` to display when page is selected
    public init<V>(label: String, view: V) where V : View {
        self.label = label
        self.view = AnyView(view)
        
    }
}

/**
# SwitcherView
 
 Creates a view with buttons to switch between a list of views
 
 ## Example
 ```swift
 SwitcherView(pages: [
     SwitcherPage(label: "One", view: Text("Hello World!")),
     SwitcherPage(label: "Two", view: Text("GoodBye World!"))
 ])
 ```
 */
public struct SwitcherView: View {
    
    var pages: [SwitcherPage]
    
    /// - Parameter pages: `[SwitcherPage]` lists the pages to include in the switcher
    init(pages: [SwitcherPage]) {
        self.pages = pages
    }
    
    @State var pickerSelectedItem = 0
    
    public var body: some View {
        VStack{
            Picker(selection: $pickerSelectedItem, label: Text("")) {
                ForEach(pages.indices){ i in
                    Text(self.pages[i].label).tag(i)
                }
                }.pickerStyle(SegmentedPickerStyle()).padding()
            self.pages[pickerSelectedItem].view
        }
    }
}

#if DEBUG
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        
        SwitcherView(pages: [
            SwitcherPage(label: "One", view: Text("Hello World!")),
            SwitcherPage(label: "Two", view: Text("GoodBye World!"))
        ])
    }
}
#endif