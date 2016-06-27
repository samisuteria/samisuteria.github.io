---
title: Autolayout Collection View Cells
layout: post
---

Autolayout with SnapKit is really nice for laying out views for multiple screen sizes without having to do frame setting math. In iOS 7, autolayout could be used for variable height cells. It was really simple to do: 

```swift
tableView.rowHeight = UITableViewAutomaticDimension
tableView.estimatedRowHeight = 80
```

With iOS 8, the same become true for collection views but its not as simple. In this example I'm using a `UICollectionViewFlowLayout`. If we want a fixed width cell with variable height we first need to do the following in the container view contoller: 

```swift
override func viewDidLayoutSubviews() {
	super.viewDidLayoutSubviews()
	flowLayout.estimatedItemSize = CGSize(width: view.frame.width - 2 * margin, height: 50)
}
```

Then within our custom cell we override `preferredLayoutAttributesFittingAttributes`: 

```swift
override func preferredLayoutAttributesFittingAttributes(layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
	let attributes = super.preferredLayoutAttributesFittingAttributes(layoutAttributes)
	var frame = attributes.frame
	frame.size.width = layoutAttributes.size.width
	attributes.frame = frame
	return attributes
}
```
This can be used for cells that need other flexible sizes but in this basic example it works well for flexible height. 
