---
layout: post
title: "JQuery UI Tools - UI Toolkit for Dummies"
date: 2012-05-06 21:35
comments: true
categories: 
---
Interesting in fancy tabs, tooltips or overlays? -

Take a look at [JQuery UI Tools](http://jquerytools.org/) 

<!-- more -->

Tooltip
-------

Simply insert the tooltip right after the trigger element:
``` html
<a class="tip" href="...">Press here</a>
<div class="tooltip">
	This is my tip...
</div>
```
activate it after page load:
``` javascript
<script type="text/javascript">
	$('.tip').tooltip({ position: "bottom center", predelay: 500, effect: 'fade', fadeInSpeed:1000 });
</script>
```
and style it in your css (or LESS, if that matters ;-):
``` css
.tooltip {
    display:none;
    width: 250px;
    background:white;
    border: 4px @orange solid;
    padding: 10px 20px;
    color:#000;
}
```

Overlay
-------

Link the overlay to the trigger element using ```rel```:
``` html
<a class="pointer" rel="#preview">Press this!</a>
<div id="preview" class="overlay">
	Lightbox-Content goes here...
</div>
```
activate it:
``` javascript
<script type="text/javascript">
	$('a[rel]').overlay();
</script>
```
and, again, add some style:
``` css
.overlay {
    display:none;
    z-index:10000;
    background-color:#fff;
    border: 4px solid @orange;
    padding: 10px 20px;
}
 
.overlay .close {
    background-image:url(/assets/images/close.png);
    position:absolute;
    right:-15px;
    top:-15px;
    cursor:pointer;
    height:35px;
    width:35px;
}
```
as well as this close button:
{% img right /images/close.png %}