# General Components 

## Contents
 
- [Bar View](#bar%20view)
- [Button Styles](#button%20syles)

## Bar View

This is a progress bar that can be set in various states. 

[Full documentation](https://quickcomponents.lucasdesouza.net/barview/)

```swift
VStack {
    BarView(value: 22, max: 30)
    BarView(value: 35, max: 30) // Notice that this bar overflows its max. This is why there is a indicator on the bar.
    BarView(value: 30, max: 30)
    BarView(value: 22, max: 30, showLabel: nil, color: .green)
    BarView(value: 22, max: 30, showLabel: true, color: nil)
    BarView(value: 22, max: 30, showLabel: true, color: .red)
}
```
<img src="../assets/barView.png" width="300"/>

You can also set the bar based on percentages:


```swift
VStack {
    BarView(percent: 25)
    BarView(percent: 50)
    BarView(percent: 75)
    BarView(percent: 100)
}
```

## Button Styles

Simple button styling to make styling your buttons quicker. This feature is still not very customizable but will be enhanced in later versions.


**Full documentation links**
- [Primary Button](https://quickcomponents.lucasdesouza.net/PrimaryButton/)
- [Secondary Button](https://quickcomponents.lucasdesouza.net/SecondaryButton/)
- [Disabled Button](https://quickcomponents.lucasdesouza.net/DisabledButton/)

There are three button styles available
```swift
    Button(action: {}){
        Text("Secondary")
    }.buttonStyle(PrimaryButton())

    Button(action: {}){
        Text("Secondary")
    }.buttonStyle(SecondaryButton())

    Button(action: {}){
        Text("Secondary")
    }.buttonStyle(DisabledButton())
```

By default these buttons will take up as much space as is available to them. You can adjust the size of your button with the frame modifier.
```swift
    Button(action: {}){
        Text("Disabled")
    }.buttonStyle(PrimaryButton())
        .frame(width: 100, height: 50)
```

You can set the border/fill styling
```swift
    Button(action: {}){
        Text("Primary")
    }.buttonStyle(PrimaryButton())

    Button(action: {}){
        Text("Primary")
    }.buttonStyle(PrimaryButton(variant: .outlined))

    Button(action: {}){
        Text("Primary")
    }.buttonStyle(PrimaryButton(variant: .contained))
```
<img src="../assets/buttonStyles.png" width="300"/>
<img src="../assets/buttonStylesDark.png" width="300"/>

