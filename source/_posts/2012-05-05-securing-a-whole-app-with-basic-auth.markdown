---
layout: post
title: "Securing a whole app with Basic Auth"
date: 2012-05-05 10:50
comments: true
categories: Play
---
Our game-changing new app went to heroku for user tests.
Currently it is in a closed test phase.
(Lean startup enthusiast? - Me too, I'll love to discuss why we're doing that).

So I had to put a simple basic auth in front of it.
Well, simple with Play 2.0:

{% gist 2594860 %}
 