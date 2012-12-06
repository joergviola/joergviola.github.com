---
layout: recipe
title: Installing Play
---

In order to work with Play 2.1, built on top of Scala 2.10, you have two options:

## Working with the current 2.1 Release

```
	$ curl http://download.playframework.org/releases/play-2.1-RC1.zip
	$ unzip play-2.1-RC1.zip
	$ export PATH=$PATH:/path/to/play-2.1-RC1
```

## Build the current master of Play

```
	$ git clone git://github.com/playframework/Play20.git
	$ cd Play20/framework
	$ ./build
	> publish-local
	> exit
	$ export PATH=$PATH:/path/to/Play20
```

To forget to update frequently:
```
	$ cd Play20
	$ git pull
	$ cd framework
	$ ./build
	> publish-local
	> exit
```


## Setting up eclipse

If you are feeling adventurous, you may use Scala-IDE in Eclipse 4 Juno:

* Download Juno from [http://www.eclipse.org/downloads/](http://www.eclipse.org/downloads/)
* Install and start
* Install Scala-IDE from ```http://download.scala-ide.org/sdk/e38/scala210/dev/site/```

Now, after ```play eclipse```, you should be able to build your Play 2.1, Scala 2.10 
projects from Scala-IDE.

		