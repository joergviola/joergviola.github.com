---
layout: recipe
title: Storing a model in a (relational) Database
---
## Scala

In scala, a model is typically implemented as a case class:

{% include_source model/model-scala/app/models/BlogEntry.scala model %}

One way of implementing persistence is using Typesafe Slick.
In order to get a driver-independent mapping of RDBMS tuples to
instances of the model, a DAO class is created with the driver as an 
argument.

{% include_source model/model-scala/app/models/BlogEntry.scala dao %}

Then the drivers Table trait is imported.

Eventually, the mapping is defined 

* in terms of the columns and their types and names and
* a projection named '*' concatenating the columns and a compose/decompose 
pair of functions.

In order to be able to access the database, the following trait can then be used

{% include_source model/model-scala/app/controllers/Persistent.scala model %}

It defines a function named ```TransAction```, which defined a Play controller 
Action that runs in the context of a database transaction.
Also, it defines all DAO classes to be used by the controller.  

In the controller, the ```TransAction``` can simply be used:  

{% include_source model/model-scala/app/controllers/Application.scala model %}


## Java
