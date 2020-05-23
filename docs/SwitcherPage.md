# SwitcherPage

``` swift
public struct SwitcherPage
```

# SwitcherPage

Used to define a page for SwitcherView.

## Example

``` swift
SwitcherPage(label: "One", view: Text("Hello World!")),
```

## Initializers

### `init(label:view:)`

``` swift
public init<V>(label: String, view: V) where V: View
```

#### Parameters

  - label: - label: `String` for page in switcher button title
  - view: - view: `View` to display when page is selected

## Properties

### `label`

``` swift
var label: String
```

### `view`

``` swift
var view: AnyView
```
