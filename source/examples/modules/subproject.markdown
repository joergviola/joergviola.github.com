---
layout: recipe
title: Using subprojects
---

Decomposing your application into subprojects can reduce build times a lot.
Also, it adds structure to your source tree.
The example app is a very simple two-pager, adding twitter bootstrap via
WebJars as the only goodie. We want to hide the (very small) complexity 
of bootstrap/webjars in a sub-project called "pages":

## The sbt build

Lets start as ```Build.scala```, where you define the sub-project.
In general, you can have all types of sbt-projects here, but we are interested in
Play-like sub-projects.

The only external dependency is twitter bootstrap, which is very conveniently added
via the [WebJars-repository](http://www.webjars.org):

{% include_source modules/modules-scala/project/Build.scala Webjars %}

The more interesting part is of course the actual definition of the sub-project, 
```pages``` in this case. It looks like the usual Play Project definition in build files,
despite the ```path``` argument, that specifies its location in the source tree.

Afterwards, the sub-project is used in the ```dependsOn```-clause of the actual main
project:

{% include_source modules/modules-scala/project/Build.scala projects %}

Note how the dependencies, namely the webjars, are passed to both projects here.
This is a little awkward and I'll explain it later.

## Routes

Now that we have declared the sub-project, we want to define the routes:

{% include_source modules/modules-scala/conf/routes allall %}

Note how requests to URIs staring with ```/pages``` are delegates to the router of the
sub-project. (Note also that we are declaring a webjars asset helper, which is why we need 
the dependency to webjars in the main project.)

The routes file of the sub-project, ```modules/pages/conf/pages.conf```, 
looks more or less boring:

{% include_source modules/modules-scala/modules/pages/conf/pages.routes allall %}

(Note that again, the webjars asset helper is included, which is one reason for requiring 
the dependency for the sub-project. We need this because we want to add bootstrap to the 
main template, which is defined in the sub-project.) 
 
## Controller

The controllers of sub-projects are the same as for main projects, only that they should
be put in the correct namespace, e.g. ```controllers.pages```:

{% include_source modules/modules-scala/modules/pages/app/controllers/Pages.scala allall %}

## View

The only interesting view is the main template in the sub project:

First, the bootstrap ressources are imported via webjar:
{% include_source modules/modules-scala/modules/pages/app/views/pages/main.scala.html Webjars %}

Afterwards, the usual bootstrap code can be used. Note how a reverse route into the 
sub project is formulated:
{% include_source modules/modules-scala/modules/pages/app/views/pages/main.scala.html Content %}

This template can now very easily be used from the main project:
{% include_source modules/modules-scala/app/views/index.scala.html allall %}

## References:

* [http://twitter.github.com/bootstrap/](http://twitter.github.com/bootstrap/)
* [http://www.webjars.org/documentation](http://www.webjars.org/documentation)
* [http://www.playframework.org/documentation/2.0.4/SBTSubProjects](http://www.playframework.org/documentation/2.0.4/SBTSubProjects)
