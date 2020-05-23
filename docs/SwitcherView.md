# SwitcherView

``` swift
public struct SwitcherView: View
```

# SwitcherView

Creates a view with buttons to switch between a list of views

## Example

``` swift
SwitcherView(pages: [
    SwitcherPage(label: "One", view: Text("Hello World!")),
    SwitcherPage(label: "Two", view: Text("GoodBye World!"))
])
```

## Inheritance

`View`

## Initializers

### `init(pages:)`

``` swift
init(pages: [SwitcherPage])
```

#### Parameters

  - pages: - pages: `[SwitcherPage]` lists the pages to include in the switcher

## Properties

### `pages`

``` swift
var pages: [SwitcherPage]
```

### `pickerSelectedItem`

``` swift
var pickerSelectedItem
```

### `body`

``` swift
var body: some View
```
