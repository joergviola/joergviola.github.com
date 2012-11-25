---
layout: recipe
---

# Creating an application

You have installed Play 2. Now you are able to create a new application
from scratch.

If you want to edit it later in Eclipse, be sure to execute the following 
steps in an Eclipse workspace folder.

To create a new Play 2 application, simply type 
```
	$ play create app-name
```
This will create an application in a new folder, named app-name.
```
	       _            _
	 _ __ | | __ _ _  _| |
	| '_ \| |/ _' | || |_|
	|  __/|_|\____|\__ (_)
	|_|            |__/
	
	play! 2.1-SNAPSHOT (using Java 1.6.0_37 and Scala 2.10.0-RC1), http://www.playframework.org
	
	The new application will be created in /Users/viola/Workspaces/scala-2.10/app-name
	
	What is the application name? 
	> app-name
```
Play now asks you to enter the name again - simply type return:
```
	Which template do you want to use for this new application? 
	
	  1             - Create a simple Scala application
	  2             - Create a simple Java application
```
Now you can decide whether you want to code your Play 2 app in Scala or Java.
Throughout these examples, you will find the two languages side by side:

## Scala
Type 1 for creating a Scala app.
```
	OK, application app-name is created.
	
	Have fun!
```
If you want to use Eclipse for development, generate the project file now.
This is the first time your project gets compiled. Now the denpendencies are 
resolved and libraries downloaded, so be prepared to pause a moment:
```
	$ cd app-name/
	$ play eclipse   
	[info] Loading project definition from /Users/viola/Workspaces/scala-2.10/app-name/project
	[info] Set current project to app-name (in build file:/Users/viola/Workspaces/scala-2.10/app-name/)
	[info] About to create Eclipse project files for your project(s).
	[info] Updating {file:/Users/viola/Workspaces/scala-2.10/app-name/}app-name...
	[info] Done updating.                                                             
	[info] Compiling 5 Scala sources and 1 Java source to /Users/viola/Workspaces/scala-2.10/app-name/target/scala-2.10/classes...
	[info] Successfully created Eclipse project files for project(s):
	[info] app-name
```
Now you can start your favorite editor an peek into the generated sources.

## Java
Type 2 for creating a Java app.
```
	OK, application app-name is created.
	
	Have fun!
```
If you want to use Eclipse for development, generate the project file now.
This is the first time your project gets compiled. Now the denpendencies are 
resolved and libraries downloaded, so be prepared to pause a moment:
```
	$ cd app-name/
	$ play eclipse   
	[info] Loading project definition from /Users/viola/Workspaces/scala-2.10/app-name/project
	[info] Set current project to app-name (in build file:/Users/viola/Workspaces/scala-2.10/app-name/)
	[info] About to create Eclipse project files for your project(s).
	[info] Updating {file:/Users/viola/Workspaces/scala-2.10/app-name/}app-name...
	[info] Done updating.                                                             
	[info] Compiling 5 Scala sources and 1 Java source to /Users/viola/Workspaces/scala-2.10/app-name/target/scala-2.10/classes...
	[info] Successfully created Eclipse project files for project(s):
	[info] app-name
```
Now you can start your favorite editor an peek into the generated sources.

		