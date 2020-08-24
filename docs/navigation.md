


## Switcher View

This is a very simple view that can be used to toggle between two other views. It can be placed above and below the views being toggled.

[Full documentation](https://quickcomponents.lucasdesouza.net/switcherview/)


```swift
SwitcherView(pages: [
    SwitcherPage(label: "One", view: Text("Hello World!")),
    SwitcherPage(label: "Two", view: Text("GoodBye World!"))
])
```

To place the picker below the views:


```swift
SwitcherView(pages: [
    SwitcherPage(label: "One", view: Text("Hello World!")),
    SwitcherPage(label: "Two", view: Text("GoodBye World!"))
])
```

<img src="../assets/switcherView.gif" width="300"/>
