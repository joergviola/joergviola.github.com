---
layout: post
title: "Blogging on GitHub with Octopress"
date: 2012-05-05 10:10
comments: true
categories: 
- Blog
- Github 
---

I already knew I could publish a static site from github.
Well, I was impressed how simple it is to publish a fully functional blog using 
[jekyll](http://github.com/mojombo/jekyll) or, even simpler, [Octopress](http://octopress.org/).

<!-- more -->

I do demonstrate some capabilities here.
You can access the source of this page 
[here](https://raw.github.com/joergviola/joergviola.github.com/source/source/_posts/2012-05-05-blogging-on-github-with-octopress.markdown).

A caption
---------

This is a test:

* Of a
very lazily written
unordered list
* with a second item

Here comes some text

1. well, numbered
1. lists I seem to have understood now (you must seperate them from unordered lists by some text)

I had a problem during install reading

``` bash
sam:octopress viola$ rake setup_github_pages
rake aborted!
You have already activated rake 0.9.2.2, but your Gemfile requires rake 0.9.2. Using bundle exec may solve this.
```   
So I built several helper scripts, the longest being
``` bash deploy
bundle exec rake generate
bundle exec rake deploy
git push origin source
```   


{% gist 2594860 %}

[a link](http://disqus.com)

***