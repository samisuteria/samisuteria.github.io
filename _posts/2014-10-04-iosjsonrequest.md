---
title: iOS JSON Request
layout: post
---

Getting data from a server is a pretty common task in iOS and I found a lot of examples using AFNetworking and other libaries out there. This example is how to get JSON data from a server and serialize it into a NSDictionary so you can use it in your app using all built in functions. 

Our API today will be [Markit On Demand](http://dev.markitondemand.com). You can check out their API docs and see everything it can do. Today we're just going to get the last price for a certain stock. 

[Here](http://dev.markitondemand.com/Api/v2/Quote/json?symbol=AAPL) is the response from the API when looking up AAPL.

So how do we get this data into iOS? First we have to make an NSURL object, then a NSData object with the content of that URL, then finally we need to deserialize that data into a NSDictionary that we can use. 

{% highlight objective-c %}

NSURL *apiURL = [NSURL URLWithString:@"http://dev.markitondemand.com/Api/v2/Quote/json?symbol=AAPL"];
    
NSData *apiJSONData = [NSData dataWithContentsOfURL:apiURL];
    
NSDictionary *stockData = [NSJSONSerialization JSONObjectWithData:apiJSONData options:NSJSONReadingMutableContainers error:nil];

{% endhighlight %}

If you want to take user input for the searches, you can use NSString's build in function stringWithFormat as seen here: 

{% highlight objective-c %}

NSString *stockSymbol = @"AAPL";
    
NSURL *apiURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://dev.markitondemand.com/Api/v2/Quote/json?symbol=%@", stockSymbol]];

{% endhighlight %}

Finally when you have your NSDictionary with info you can show that to the user with some labels on the screen. 

{% highlight objective-c %}

nameLabel.text = [NSString stringWithFormat:@"Name: %@",[stockData objectForKey:@"Name"]];
priceLabel.text = [NSString stringWithFormat:@"Price: %@", [stockData objectForKey:@"LastPrice"]];

{% endhighlight %}