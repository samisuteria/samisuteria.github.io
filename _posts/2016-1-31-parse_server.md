---
title: Parse Server - Fresh Start
layout: post
---

With Parse's epic [announcement](http://blog.parse.com/announcements/moving-on/) that they are shutting down their server in a year and that they open sourced the server portion that works with the exisiting iOS SDK's - I need to figure out how to move an app I'm developing from Parse to Parse Server on Heroku. Here's the steps I did to get a basic app up and running. 

*Setup*

- Install/Update/Upgrade Homebrew `brew update` `brew upgrade`
- Install Node (if you don't have it)  `brew install node`
- Install MongoDB `brew install mongodb`

*Node Server*

- Make a new folder for your server `cd MyAwesomeServer`
- Make a new git repo `git init`
- Create your main file `touch app.js` 
- Go through npm's setup `npm init`
- Install Parse Server `npm install parse-server --save`
- Open app.js and add this: 

```javascript
var express = require('express');
var ParseServer = require('parse-server').ParseServer;

var app = express();

var api = new ParseServer({
	databaseURI: 'mongodb://localhost:27017/dev',
  	appId: 'myAppId',
  	masterKey: 'mySecretMasterKey',
  	clientKey: 'someKeyForClients',
});

// Any calls to server address/parse will use Parse Server
app.use('/parse', api)

// Basic response
app.get('/', function(request, response) {
	response.status(200).send('Express Server is running');
});

var port = process.env.PORT || 9001;
app.listen(port, function() {
	console.log('myawesomeserver running on port: ' + port);
});
```

- Run your new server `node app.js`
- Check your server is running by going to [localhost:9001](localhost:9001)
- Modify package.json and add `"start": "node app.js",` to the scripts dictionary


*MongoDB*

- Create an account on [MongoLab](https://mongolab.com/)
- Create a new instance: Single-node Sandbox (free)
- Click on the server and create a database user 
- Modify the databaseURI in app.js with the connection URI listed on the site 

*iOS App*

- Add/Update Parse Pod currently: `pod 'Parse', '~> 1.12.0'`
- In your AppDelegate initial Parse with your server settings:

{% highlight swift %}
Parse.initializeWithConfiguration(ParseClientConfiguration(block: { (configuration: ParseMutableClientConfiguration) -> Void in
            configuration.applicationId = "myAppId"
            configuration.clientKey = "someKeyForClients"
            configuration.server = "http://localhost:9001/parse"
}))
{% endhighlight %}

- To test in some viewcontroller's viewDidAppear add: 

{% highlight swift %}
let myCar = PFObject(className: "Car")
myCar["color"] = "green"
myCar.saveInBackground()
{% endhighlight %}

- You might get some errors about App Transport Security - its easy to fix [Stackoverflow](http://stackoverflow.com/questions/32631184/the-resource-could-not-be-loaded-because-the-app-transport-security-policy-requi)

- Verify on MongoLab that the data was saved correctly

*Heroku*

- Make a Heroku Account 
- Get Familiar with Heroku: [Getting Started](https://devcenter.heroku.com/articles/getting-started-with-nodejs#introduction) or :
- Install Heroku Toolbelt `brew install heroku-toolbelt`
- Login `heroku login`
- Commit everything to git if you haven't yet `git add .` `git commit -m "Some Message"`
- Create your heroku app `heroku create myawesomeapp`
- Push your app to heroku `git push heroku master`
- Verify its running at the deploy URL returned by Heroku 
- Update server URL in your iOS App - you can remove the App Transport Security stuff since Heroku runs apps on HTTPS
- Verify on MongoLabs that your test was created

*Woo!*

- Have a drink and relax now that you aren't reliant on Parse.com 

### References

- [Parse Server Docs](https://parse.com/docs/server/guide#overview)
- [Parse Server Repo](https://github.com/ParsePlatform/parse-server)
- [Heroku - Getting Started with Node.js](https://devcenter.heroku.com/articles/getting-started-with-nodejs#introduction)
- [MongoLabs](https://mongolab.com/home)

