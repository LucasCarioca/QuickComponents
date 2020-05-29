# QuickComponents

*A set of reusable components to speed up developing complex UIs with SwiftUI.*

> ⚠️ **The project is currently in very early stages of development.**
Contributions are welcome

## Getting started

**Requirements:**
- iOS 13 
- Xcode 11.4

**Installation:**
- Open Xcode Project
- Select `File -> Swift Packages -> Add Package Dependency` 
- Past this repo's url: `https://github.com/LucasCarioca/QuickComponents`

### Usage:

import the package in the file you would like to use it: `import QuickComponents`

### Documentation

You can find our documentation here: [Docs](https://quickcomponents.lucasdesouza.net)

### Component Examples

[**SwitcherView**](https://quickcomponents.lucasdesouza.net/switcherview/)
```swift
SwitcherView(pages: [
    SwitcherPage(label: "One", view: Text("Hello World!")),
    SwitcherPage(label: "Two", view: Text("GoodBye World!"))
])
```
<img src="assets/switcherView.gif" width="300"/>

[**BarView**](https://quickcomponents.lucasdesouza.net/barview/)
```swift
struct ProgressView: View {
    @State var timePublisher = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var counter: CGFloat = 0
    var body: some View{
        BarView(value: self.counter, max: 5).onReceive(self.timePublisher) { time in
            if (self.counter < 5) {
                self.counter += 1
            }
        }
    }
}

...

ProgressView()
```

<img src="assets/barView.gif" width="300"/>

**Button Styles**


Based on Material UI buttons. 

<img src="assets/buttonStyles.png" width="300"/>

[**PrimartButton**](https://quickcomponents.lucasdesouza.net/PrimartButton/)
```swift
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
```

[**SecondaryButton**](https://quickcomponents.lucasdesouza.net/SecondaryButton/)
```swift
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
```
[**DisabledButton**](https://quickcomponents.lucasdesouza.net/DisabledButton/)
```swift
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
```



