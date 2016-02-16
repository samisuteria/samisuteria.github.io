---
title: Swift 2 - For/In/Where
layout: post
---

Swift is pretty awesome and the more I use it the more I love it! The *where* keyword is really useful for quick and simple filtering. 

You can do it like this and its pretty straight forward: 

```swift
for subview in view.subviews {
	if subview.isKindOfClass(UIButton.self){
		subview.removeFromSuperview()
	}
}
```

Or you could do it with a filter function: 

```swift
for subview in view.subviews.filter({ return $0.isKindOfClass(UIButton.self) }) {
	subview.removeFromSuperview()
}
```

or you could use the *where* keyword which I find much more readable. 

```swift
for subview in view.subviews where subview.isKindOfClass(UIButton.self){
	subview.removeFromSuperview()
}
```

Only downside that I can see with using *where* is that you can't chain multiple predicates together like you can with filter functions. 