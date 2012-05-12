---
layout: post
title: "Why Scala templates rock"
date: 2012-05-12 18:19
comments: true
categories: Play Scala
---
Play 2.0 uses Scala for HTML templates.
They are checked at compile-time, so you never again get ghostly errors in production
due to unforeseen situations.

But besides that, you can do other great things with ease. 
Using a practical application of Scala functions for list pagination, for example. 

<!-- more -->

Pagination with EBean
---------------------

The EBean ORM used by Play 2.0 provides tools for very simply querying for paginated lists.
Since our web application is about seminars, we have e.g. this accessor for top rated seminars:
``` java Seminar.java
public static Page<Seminar> top(int size, int page) {
	return find.where().orderBy("rating desc")
	       .findPagingList(size).getPage(page);
``` 
This can be used by our `Publics` controller to render a page of top rated seminars:
``` java Publics.java
public static Result top(int page) {
	return ok(top.render(Seminar.top(10, page)));
}
```
The template for rendering this list is very simple:
``` html top.scala.html
@(seminars : Page[Seminar])

@for(seminar <- seminars.getList){
	@seminarInList(seminar)
}	
```
and pagination is added equally simple:
``` html seminarList.scala.html
@if(seminars.getTotalPageCount>1){
    @if(seminars.hasPrev) {
        <a href="@routes.Publics.top(seminars.getPageIndex - 1)">&larr;</a>
    } else {
        &larr;
    }
    @for(p <- 1 to page.getTotalPageCount) {
	    @if(p-1==seminars.getPageIndex) {
	        @p
	    } else {
	        <a href="@routes.Publics.top(p-1)">@p</a>
	    }
	}
    @if(seminars.hasNext) {
        <a href="@routes.Publics.top(seminars.getPageIndex + 1)">&rarr;</a>
    } else {
        &rarr;
    }
}	
```

Add flexibility with Scala functions
------------------------------------

As you can image, we have all kind of seminar lists: Top rated, newest, in one category and so on.
We would of course very much like to have a sub-template capable of rendering any list of seminars.
But the pagination links then have to be customized.

This can be done easily using Scala functions:
The method of the router representing the link in Scala reads `routes.Publics.top(page:Int):Call`.
Applying the Scala wildcard `_` to it like in `routes.Publics.top(_)` creates a Scala function
mapping an Int to a Call: `Int => Call`. Functions of this type are exactly the parameters we want to have 
in a generalized seminar list template:
``` html seminarList.scala.html
@(seminars : Page[Seminar], link: Int => Call)

@for(seminar <- seminars.getList){
	@seminarInList(seminar)
}	
```
because the pagination can then make simple use of it:
``` html seminarList.scala.html
@if(seminars.getTotalPageCount>1){
    @if(seminars.hasPrev) {
        <a href="@link(seminars.getPageIndex - 1)">&larr;</a>
    } else {
        &larr;
    }
    @for(p <- 1 to page.getTotalPageCount) {
	    @if(p-1==seminars.getPageIndex) {
	        @p
	    } else {
	        <a href="@link(p-1)">@p</a>
	    }
	}
    @if(seminars.hasNext) {
        <a href="@link(seminars.getPageIndex + 1)">&rarr;</a>
    } else {
        &rarr;
    }
}	
```
This sub-template can then simply be called like:
``` html top.scala.html
@seminarList(top, routes.Publics.top(_))	
```
or
``` html newest.scala.html
@seminarList(newest, routes.Publics.news(_))	
```

Scala templates rock!