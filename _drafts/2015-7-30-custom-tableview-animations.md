---
title: Custom UITableView Animations
layout: post
---

# Custom UITableView Animations

Sometimes you want cells to change content/size when selected and transitioning nicely to the new state can be messy. The most basic way is to change the content in a cell is to configure it in the cellForRow method and then call reloadData in didSelectRowAtIndexPath. 


{% highlight swift linenos %}
func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    cell.label.text = selectedIndexPath.row == indexPath.row ? "Cell is selected!" : "Cell: " + String(indexPath.row)
}

func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
	tableView.reloadData()
}
{% endhighlight %}

![Example 1](http://i.imgur.com/TeHhRXn.gif)