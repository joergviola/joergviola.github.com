---
layout: post
title: "Scala pearls for a dummy"
date: 2012-05-06 11:33
comments: true
categories: Play, Scala
---

After migrating to Play 2.0, being convinced one can use it with Java alone, 
I was curious enough to take a look at the Scala side of it.
Read about some nice little discoverings of a scla beginner. 
<!-- more -->

Of course, the first contact happens in Play 2.0 templates:

Typesafe
--------
Templates have a signature, types are behind names and type parameters use square brackets.
Thus the first line in every template reads like: 
``` html
@(state:State, users:List[User])
```

Looping
-------

It is simple to loop over any collection:
``` html
@for(user <- users) {
	<li><a href="@routes.Publics.user(user.id)">@user.name</a></li>
}
```
The cool thing is, you don't need any template extension or whatever to get the looping index. 
And you have tuples:
``` html
@for((user,index) <- users.zipWithIndex) {
	@if(index>0){
		<div class="seperator"></div>
	}
	<a href="@routes.Publics.user(user.id)">@index. @user.name</a>
}
```
And - you have functions:
``` html
@users.zipWithIndex.foreach { (user, index) =>
	@if(index>0){
		<div class="seperator"></div>
	}
	<a href="@routes.Publics.user(user.id)">@index. @user.name</a>
}
```
or
``` html
    <select name="@name" multiple="multiple">
        @options.map { v =>
            <option value="@v._1" @(if(v._3) "selected" else "")>@v._2</option>
        }
    </select>
```
Did you ever require a String representation of a list?
``` scala
columns.map("<td>" + _ + "</td>").mkString
```


Filtering
---------

Imagine you were to get all Fields of a class with the annotation @Id. Here is the java code:
``` java
  public List<Field> idFields(Class<? extends Object> c) {
  	List<Field result = new ArrayList<Field>();
  	for (Field f : c.getFields()) {
  		if (f.getAnnotation(Id.class)!=null) 
  			result.add(f);
  	}
  	return result;
  }
```
and this is scala:
``` scala
  def idFields(c: Class[_ <: Any]): Seq[Field] = c.getFields().toSeq filter { f => f.getAnnotation(classOf[Id]) != null }
``` 

Case classes
------------

Talking about shortness:
``` java
public class Person {
	private String firstName;
	private String lastName;
	private Date birthday;
	private boolean gender;

	public Person(String firstName, String lastName, Date birthday,
			boolean gender) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.birthday = birthday;
		this.gender = gender;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((birthday == null) ? 0 : birthday.hashCode());
		result = prime * result
				+ ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result + (gender ? 1231 : 1237);
		result = prime * result
				+ ((lastName == null) ? 0 : lastName.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Person other = (Person) obj;
		if (birthday == null) {
			if (other.birthday != null)
				return false;
		} else if (!birthday.equals(other.birthday))
			return false;
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (gender != other.gender)
			return false;
		if (lastName == null) {
			if (other.lastName != null)
				return false;
		} else if (!lastName.equals(other.lastName))
			return false;
		return true;
	}

}
```
is equivalent to:
``` scala
  case class Person(val firstName:String, lastName:String, birthday:Date, gender:boolean);
``` 

Built-in singletons
-------------------

No static methods:
``` java
class Person {
    ...
	public static Person create() {
	   ...
	   return person;
	}
}
```

is equivalent to:
``` scala
  case class Person(val firstName:String, lastName:String, birthday:Date, gender:boolean);
  
  object Person {
  	def create = Person();
  }
``` 

Traits
------

Not yet used them, though they look cool!
