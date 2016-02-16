---
title: SnapKit Animations
layout: post
---

SnapKit is pretty awesome for using Auto Layout on iOS but there are some less than obvious issues for things like animations. I seem to keep returning back to this Github Issue [Masonry#37](https://github.com/SnapKit/Masonry/issues/37) to look at the example for animations. 

So pretty much it comes down to this - if you already have your view laid out and on screen do this for the animation: 

```swift
self.leadingConstraint.updateOffset(0)

view.setNeedsLayout()

UIView.animateWithDuration(0.2, delay: 0, options: [], animations: { () -> Void in 
	self.view.layoutIfNeeded()
})
```

and if you want to layout the view initally and then animate it in one go (like in a view controller's viewDidAppear):

```swift
var leadingConstraint = Constraint()

view.snp_makeConstraints { (make) -> Void in 
	make.width.equalTo(view)
	make.height.equalTo(50)
	leadingConstraint = make.leading.equalTo(view).offset(view.frame.width).constraint
}

view.layoutIfNeeded()

leadingConstraint.updateOffset(0)

UIView.animateWithDuration(0.2, delay: 0, options: [], animations: { () -> Void in 
	self.view.layoutIfNeeded()
})
```