---
title: Type Inheritance - Swift
layout: post
---

Recently I've been going a little bit crazy doing a project in Javascript/Node and the lack of types (safety) is disturbing to me. So today I was playing around with some types in Swift and noticed something interesting. So first lets set up the test playground: 

```swift
public protocol CellInfo { }

public struct WelcomeCellInfo: CellInfo { }
public struct SummaryCellInfo: CellInfo { }
public struct AmountCellInfo: CellInfo {
    let amount: Int64
}

var cells = [CellInfo]()

let amounts: [Int64] = [10, -10, 15, 5, 10]
let amountCellInfo = amounts.flatMap{ AmountCellInfo(amount: $0) }
```

This is for a data source for a table/collection view and we're passing back a struct with some info in it to the view (for context). We have an array of type `CellInfo` and we want to add structs to it that conform to that protocol. 

As expected the following works just fine: 

```swift
cells.append(WelcomeCellInfo())
cells.append(SummaryCellInfo())
cells.append(AmountCellInfo(amount: 100))
```

But we run into an interesting problem when we try to append the entire array of `transfer

```swift
// This works
amountCellInfo.forEach{
    cells.append($0)
}

// This does not
cells.appendContentsOf(amountCellInfo)
```

The problem of course is type: `amountCellInfo` has the type `AmountCellInfo` while cells has the type `CellInfo`. Its interesting how type inheritance works fine with the `append` function but does not for `appendContentsOf`. Making the following changes fixes everything. 

```swift
let amountCellInfo: [CellInfo] = amounts.flatMap{ AmountCellInfo(amount: $0) }
// This works now
cells.appendContentsOf(amountCellInfo)
```