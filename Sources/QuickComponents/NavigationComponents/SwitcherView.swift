//
//  SwiftUIView.swift
//  QuickComponents
//
//  Created by Lucas Desouza on 5/23/20.
//

import SwiftUI



/// Used to define a page for SwitcherView.
public struct SwitcherPage {
    var label: String
    var view: AnyView
    
    /// - Parameters:
    ///   - label: For page in switcher button title
    ///   - view: To display when page is selected
    public init<V>(label: String, view: V) where V : View {
        self.label = label
        self.view = AnyView(view)
    }
}


/// Creates a view with buttons to switch between a list of views
public struct SwitcherView: View {
    
    var pages: [SwitcherPage]
    var reverse: Bool
    
    /// Builds the swtcher that can toggle between the proviced views
    /// - Parameter pages: Lists the pages to include in the switcher
    /// - Parameter reverse: If true the picker will appear below the views
    public init(reverse: Bool = false, pages: [SwitcherPage]) {
        self.pages = pages
        self.reverse = reverse
    }

    
    @State var pickerSelectedItem = 0
    
    public var body: some View {
        VStack{
            if self.reverse{
                self.pages[pickerSelectedItem].view
            }
            Picker(selection: $pickerSelectedItem, label: Text("")) {
                ForEach(pages.indices){ i in
                    Text(self.pages[i].label).tag(i)
                }
                }.pickerStyle(SegmentedPickerStyle())
            if !self.reverse{
                self.pages[pickerSelectedItem].view
            }
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

struct SwiftUIView_rev_Previews: PreviewProvider {
    static var previews: some View {
        
        SwitcherView(reverse: true, pages: [
            SwitcherPage(label: "One", view: Text("Hello World!")),
            SwitcherPage(label: "Two", view: Text("GoodBye World!"))
        ])
    }
}
#endif
