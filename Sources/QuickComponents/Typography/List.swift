//
//  OrderedList.swift
//  QuickComponents
//
//  Created by Lucas Desouza on 7/12/20.
//

import SwiftUI

/// Creates a simple HTML like ordered list
public struct OrderedList: View {
    var items: [String]
    /// Creates a simple HTML like ordered list with the privided list of items
    /// - Parameter items: List of items to be displayed
    public init(items: [String]){
        self.items = items
    }
    public var body: some View {
        VStack{
            ForEach(items.indices) { i in
                ListItem(index: "\(String(i+1)). ", text: self.items[i])
            }
        }
    }
}

/// Creates a simple HTML like unordered list
public struct UnorderedList: View {
    var items: [String]
    /// Creates a simple HTML like unordered list with the privided list of items
    /// - Parameter items: List of items to be displayed
    public init(items: [String]){
        self.items = items
    }
    public var body: some View {
        VStack{
            ForEach(items, id: \.self) { item in
                ListItem(index: "• ", text: item)
            }
        }
    }
}

struct ListItem: View {
    var index: String
    var text: String
    var body: some View {
        HStack {
            Text("\(index)")
            Text(text)
            Spacer()
            }.Paragraph()
    }
}

struct OrderedList_Previews: PreviewProvider {
    static var previews: some View {
        OrderedList(items: [
            "step one",
            "step two",
            "step three"
        ])
    }
}

struct UnorderedList_Previews: PreviewProvider {
    static var previews: some View {
        UnorderedList(items: [
            "step one",
            "step two",
            "step three"
        ])
    }
}
