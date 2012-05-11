---
layout: post
title: "Upgrading to Play 2.0.1"
date: 2012-05-11 08:31
comments: true
categories: Play
---

Play 2.0.1 is here!
Learn how to upgrade and what to gain.

<!-- more -->

What to gain
------------

[Here](https://groups.google.com/forum/?fromgroups#!searchin/play-framework/2.0.1$20is$20ready/play-framework/XtJk-LFBtCw/uIqCZxpzG-wJ) 
is the announcement.

For me, the following enhancements are important:

* EBean enhancement seems to be fixed - no enhancement errors until now.
* more efficient sbt dependency check - the number of files that are compiled after a change
  seems to have been reduced. That improves turn-around speed a lot.

How to upgrade
--------------

1. Download [Play 2.0.1](http://download.playframework.org/releases/play-2.0.1.zip)
1. Unzip and move to $SOMEDIR/play-2.0.1
1. Add to $PATH: $SOMEDIR/play-2.0.1, removing your play-2.0-setting
1. Update project/plugins.sbt to include

		addSbtPlugin("play" % "sbt-plugin" % "2.0.1")

1. If you had tweaked your Build.scala to path the ebean enhancement, reset it to something like the following:

		import sbt._
		import Keys._
		import PlayProject._
		
		object ApplicationBuild extends Build {
		
		    val appName         = "66and33-web"
		    val appVersion      = "1.0-SNAPSHOT"
		
		    val appDependencies = Seq(
		      "postgresql" % "postgresql" % "8.4-702.jdbc4"
		    )
		    val main = PlayProject(appName, appVersion, appDependencies, mainLang = JAVA).settings(
		    		templatesImport += "util._"
		    )
		    
		}

1. run ```play eclipsify```
1. as in 2.0, tweak the generated project by
   1. removing the output folders on the source folders ./app and ./test. The effectively tells eclipse to compile into ./bin 
      which does not interfere with the sbt compilation
   1. add target/scala-2.9.1/classes to your build path. This allows access e.g. to the ReverseControllers

