---
layout: recipe
title: Storing a model in a (relational) Database
---
## Scala

One way of implementing persistence is using 
[Typesafe Slick](http://slick.typesafe.com).
In order to get a driver-independent mapping of RDBMS tuples to
instances of the model, one may take a look at the driver configured and
map it to the corresponding slick driver class:
{% include_source model/model-scala/app/controllers/Persistent.scala Store %}

The driver can then be used to create the models. 
It is imported together with the slick driver base class ```ExtendedProfile``` 
and the slick session (= database connection):  
{% include_source model/model-scala/app/models/BlogEntry.scala import %}

Then the model is easily written down. If an auto-increment primary key 
is required, it is given as an Option: 
{% include_source model/model-scala/app/models/BlogEntry.scala model-auto-id %}

The mapping is formulated 

* in terms of the columns and their types and names and
* a projection named '*' concatenating the columns and a compose/decompose 
pair of functions.

If an autoincrement primary key is involved, it is a good idea to define 
a second projection that returns the newly created id after an insert:

{% include_source model/model-scala/app/models/BlogEntry.scala dao-auto-id %}

If a reference is required, one first has to accept that slick strictly
inhibits the use of lazy loading (you can use it, but you're on your own then).
Instead, joins are used. Let's see how. 
The model only contains the id of the referenced object:

{% include_source model/model-scala/app/models/BlogEntry.scala model %}

The mapping declares a ```foreignKey``` based on this id:
 
{% include_source model/model-scala/app/models/BlogEntry.scala dao-reference %}

In order to be able to access the database, the following trait can then be used.
It reads the actual DB to be used from the configuration as a datasource
and then translates it to a Slick Database:

{% include_source model/model-scala/app/controllers/Persistent.scala Persistent %}

Now we are able to define a controller action that is running in a slick
transaction context:

{% include_source model/model-scala/app/controllers/Persistent.scala TransAction %}

Now lets put all this together in the controller by subclassing ```Persistent``` 
and defining a ```TransAction```:

{% include_source model/model-scala/app/controllers/Application.scala Controller %}

Inserts can be done like follows. Observe how the auto-increment id is used to establish
the reference:

{% include_source model/model-scala/app/controllers/Application.scala Insert %}

Slick is providing a lot of magic when it comes to queries, so that a join
can be formulated as a standard scala ```for``` using the ```foreignKey``` to
establish the join:

{% include_source model/model-scala/app/controllers/Application.scala Query %}

Moreover, a simple ```session.rollback``` or throwing an exception would
rollback the transaction.

The view is then very simple:

{% include_source model/model-scala/app/views/index.scala.html All %}

### References

These articles have been helpful:

* [http://java.dzone.com/articles/getting-started-play-21-scala](http://java.dzone.com/articles/getting-started-play-21-scala)
* [http://www.blogeek.com.ar/2012/11/24/play-framework-2-2-1-scala-with-slick-made-easy-with-example/](http://www.blogeek.com.ar/2012/11/24/play-framework-2-2-1-scala-with-slick-made-easy-with-example/)
* [http://stackoverflow.com/questions/13114255/getting-autoincrement-values-with-slick-library-in-scala](http://stackoverflow.com/questions/13114255/getting-autoincrement-values-with-slick-library-in-scala)


## Java

To be written.
