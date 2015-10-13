---
title: Lessons Learned at Imgur
layout: post
---

This is probably gonna be an ongoing post with newest at the top. 

## Username Routing

There are a lot of different ways to show public content for users on your site:

- [imgur.com/user/sarah](http://imgur.com/user/sarah)
- [sarah.imgur.com](http://sarah.imgur.com)

But when you don't preface with something like ```/users/$username``` then you can run into collisions. At imgur we allow both the subdomain model and the prefaced route. This causes issues for when we want to make a new top level address such as **status.imgur.com** but there is already a user called **status**. This has happened multiple times. So next time make sure take some popular subdomains/usernames for internal use before hand. A basic list:

- admin
- help
- rules
- status
- about
- home

Or just make usernames at least 8 characters long and then you get to keep all these basic words for yourself. 
