---
layout: post
title: "A PDF module for Play 2.0 Java"
date: 2012-05-18 23:48
comments: true
categories: Play 
---
Yup! I just created my first Play 2.0 module!
A lot of thanks to Steve for his tips for [creating a module](http://www.objectify.be/wordpress/?p=363) 
and [publishing it on github pages](http://www.objectify.be/wordpress/?p=410).

So finally here is a preliminary release of my PDF module.
It helps in generating PDF documents dynamically.
You simply create standard Play 2.0 html templates and render them as HTML.

<!-- more -->

As an example, see [this template](https://github.com/joergviola/play20-pdf/blob/master/samples/pdf-sample/app/views/document.scala.html):
``` html document.scala.html
@(message: String)

@main("Welcome to Play 2.0") {
    Image: <img src="/public/images/favicon.png"/><br/>
    Hello world! <br/>
    @message <br/>
	<table border="1">
		<tr>
			<td>1</td>
			<td>2</td>
		</tr>
		<tr>
			<td>3</td>
			<td>4</td>
		</tr>
	</table>
}
```
As you can see, it follows some simple rules:

* use XHTML
* specify external links as filepathes into the classpath of your application.

Then this template can simply be rendered as:
``` java
	public static Result document() {
		return PDF.ok(document.render("Your new application is ready."));
	}
```  
where ```PDF.ok``` is a simple shorthand notation for:
``` java
	ok(PDF.toBytes(document.render("Your new application is ready."))).as("application/pdf")
```
I am just starting to use this module, so I don't know how limited XHTML and CSS usage is.
Just let me know in the comments - thanks!