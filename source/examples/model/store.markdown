---
layout: recipe
title: Storing a model in a (relational) Database
---
## Scala

In scala, a model is typically implemented as a case class:

{% include_source model/model-scala/app/models/BlogEntry.scala model %}

One way of implementing persistence is using 
[Typesafe Slick](http://slick.typesafe.com).
In order to get a driver-independent mapping of RDBMS tuples to
instances of the model, a DAO class is created with the driver as an 
argument.

{% include_source model/model-scala/app/models/BlogEntry.scala dao %}

Then the drivers Table trait is imported.

Eventually, the mapping is defined 

* in terms of the columns and their types and names and
* a projection named '*' concatenating the columns and a compose/decompose 
pair of functions.

In order to be able to access the database, the following trait can then be used.
It reads the currently defined database driver from the configuration and maps it to the corresponding Slick driver class:

{% include_source model/model-scala/app/controllers/Persistent.scala DriverDefinition %}

Then for access from outside, all DAOs of the project are instantiated using the driver:

{% include_source model/model-scala/app/controllers/Persistent.scala DAOs %}

Next the actual DB to be used is read from the configuration as a datasource
and then translated to a Slick Database:

{% include_source model/model-scala/app/controllers/Persistent.scala DB %}

Now we are able to define a controller ```Action``` that is running in a slick
transaction context:

{% include_source model/model-scala/app/controllers/Persistent.scala TransAction %}

In the controller, the ```TransAction``` can simply be used as follows:  

{% include_source model/model-scala/app/controllers/Application.scala model %}

Moreover, a simple ```session.rollback``` or throwing an exception would
rollback the transaction.

### References
[http://java.dzone.com/articles/getting-started-play-21-scala](http://java.dzone.com/articles/getting-started-play-21-scala)

## Java

To be written.
