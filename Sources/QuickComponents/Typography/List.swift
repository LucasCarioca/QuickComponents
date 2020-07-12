//
//  OrderedList.swift
//  QuickComponents
//
//  Created by Lucas Desouza on 7/12/20.
//

import SwiftUI

public struct OrderedList: View {
    var items: [String]
    public var body: some View {
        VStack{
            ForEach(items.indices) { i in
                ListItem(index: "\(String(i+1)). ", text: self.items[i])
            }
        }
    }
}

public struct UnorderedList: View {
    var items: [String]
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
