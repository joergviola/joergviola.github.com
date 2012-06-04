---
layout: post
title: "Page Driven Functional Tests for Play 2.0-Java"
date: 2012-06-04 20:44
comments: true
categories: Play 
---
I proudly announce the first release (0.1) of funcy, a library for
Page Driven Functional Tests for Play 2.0-Java.

[See GitHub for source and docu.](https://github.com/joergviola/funcy) 

<!-- more -->

Functional Tests in Play 2.0 are the best way to test web applications:

* In standard web applications, you simply do not have really complex business logic. There is no point in using unit tests.
* Selenium tests are hard to setup (even with Plays support), require explizit fixtures and they are very slow - too slow to be run before each commit.

Example: Booking a ticket is fairly easy: Simply write a row into a database.
Whats the point of writing a unit test for that?

Building the booking form, receiving the request, validating user input, creating the ticket,
sending the confirmation mail and displaying the confirmation page, on the other hand, is quite a
complex process.

But testing it through selenium is hard and, if you run into the trap of recording your test cases,
very prone to changes of the underlying software.

Using Page Driven Play 2.0 Functional Tests provided by funcy, you can

* write your tests as simple unit tests
* check results by accessing resulting web page DOMs or the database directly
* run them very fast against an in-memory database.

Consider this example:

``` java
	@Test
	public void testBooking() {
		IndexPage indexPage = new IndexPage();
		EventPage eventPage = indexPage.clickEvent("Sidney Opera");
		BookingPage bookingPage = eventPage.book("2012/05/07");
		ConfirmationPage confirmationPage = bookingPage.book();

		List<Booking> bookings = Booking.all();
		Assert.assertEquals("#bookings", 1, bookings.size());
	}
```
