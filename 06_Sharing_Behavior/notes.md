##Lesson 6 - Sharing Behavior


###Learning Objectives

* 	Understand Class variables and methods, distinguish from instance variables and methods
*   Create classes that use inheritance to share behavior.
*	Define modules in Ruby program.
*	Define how modules and mixins extend class behavior.


##Outline

###Review
*	Classes are a way of defining new types of objects
*	store variables and methods
*	A class is like defining a method, an instance is like calling a method

Review Questions:

* Why would you use a class instead of a hash?
* What's the difference between a class and an instance?
* What is an instance variable?
* What is attr_accessor?
* Fix this code:

```
birthday = "July 3 1985"

def happy_birthday ()
	puts "Happy birthday! Your birthday is: #{birthday}."
end

```


###Class Variables and Methods

####Review of Instance variables
* Instance variables 
	* scope is within one instance object
	* starts with @

```	
	class Robot
		attr_accessor :type

		def to_s
			"This is a #{@type} robot."
		end
	end
```


*	Instance methods 
	* are all the methods we have seen so far defined in a class (ex. the to_s above)
	* applied to a particular instance (ex. above to_s will print out different types for different instances of Robot)

####Class Methods 

#####What is a class method?
*	called directly on a class, NOT on an instance
*	avoid creating an instance of a class just to call a general method on it

#####Motivation
What if there are values or methods that aren't specific to one instance of a robot (ex. something that applies to all robots)?

Suppose we want to know what the 3 laws of robotics are. You could make an instance method and then ask a specific robot what they are, but it makes more sense to ask the Robot class (since the laws are the same for all robots.)

This is a Class Method (you call it directly on a class not an instance).

#####Codealong
```
demo_class_method.rb
```

Use ```self``` to create a Class method:

#####In-line example:
```	
class Robot
		attr_accessor :type

		def to_s ()
			"This is a #{@type} robot."
		end

		def self.show_robot_laws ()
			puts "Do not harm humans."
			puts "Obey orders from humans."
			puts "Protect yourself."
		end
	end
```

Then use it directly on the class:

```	
Robot.show_robot_laws()
```	

NOT:

```	
jerry = Robot.new()
jerry.show_robot_laws()

=> NoMethodError
```	

###Knowing Self

*	self keyword is used when definining a method name to indicate a class method
* Inside a class, self refers to the class, inside a method, self refers to the instance the method is called on
* self is also used INSIDE a method definition to indicate the current object
* a common use of self is to call the current objects methods (such as one of its attr_accessors)



####Class Variables

Class variables, like class methods, are attached to the class itself not specific instances of the class. 

Most of the time you want instance variables, but class variables can be useful.

NOTE: sadly unlike instance variables, there are no default accessors for class variables. You can't use attr_accessor, you have to write your own get/set methods.

```	
class Robot
	attr_accessor :type
	@@hive_mind_activated = false

	def self.get_hive_mind ()
		@@hive_mind_activated
	end

	def self.set_hive_mind (bool)
		@@hive_mind_activated = bool
	end
end
```
* Class variables 
	* scope is the Class itself (and all instances)
	* starts with @@
	* need to write your own get/set methods



##Inheritance

####Motivation
You're coding a model of different polygons. You want to represent a general polygon, a rectangle and a square. They share a lot of similarities, they all want to store how many sides they have and be able to tell you if it's a regular polygon. But there are also important differences, like calculating area.

####Code demo:
demo_inheritance_polygon.rb

Class Inheritance allows you to capture what is the same across different classes and customize whatever is different. It's more DRY than rewriting the same methods across many different classes.

#####Key take-aways:

*	Subclasses inherit behavior from parent classes by default
*	Can "Override" parent behavior with their own methods
* 	Use "super" to call a parent's method


####Exercise:
```
ex_inheritance_office.rb
```

####Inheritance Review

*	One class can inherit the capabilities of another using the ```<``` operator.
*	Sub-class inherits from super-class (child class inherits from parent class)
*	A child can override a parent variable or method by re-using its name
class.
*	If defined in different physical files, a child must require its parent

---

##Sharing Behavior
###Mixins

* "Mixins" are a facility to import code into a class
* They are used in cases when we don't want to use inheritance
  * Perhaps we only want a few methods from a small module, not the whole class
  * A class may want to mixin many different modules, but you can only inherit from one class
* In Ruby, we use Modules to facilitate mixins

##Mixins
###Upvotable Example

```
demo_mixin.rb:
```
Demo in-line:

```
	module Upvotable
		def upvote!
  			@upvotes += 1
	  	end

	  	def downvote!
	  		@upvotes -= 1
	  	end
	end

	class Photo
		attr_reader :photographer, :resolution, :upvotes
		include Upvotable

		def initialize(photographer, resolution)
  		@photographer = photographer
  		@resolution = resolution
  		@upvotes = 1
  	end
	end

	class Story
		attr_reader :title, :author, :upvotes
		include Upvotable

		def initialize(title, author)
  		@title = title
  		@author = author
  		@upvotes = 1
  	end
  end

  >> story = Story.new
  >> story.upvote!
  >> photo = Photo.new
  >> photo.downvote!

```

---

###Modules

*	What if we wanted to have two bat classes.

		class Bat
			def fly!
				puts "So free.. and blind"
			end
		end

		# Somewhere else in your code
		class Bat
			def made_of
				"wood"
    	end
		end

		slugger = Bat.new
		slugger.fly?!??!

---

```
  module Animal
    class Bat
      def fly!
        puts "So free.. and blind"
      end
    end
  end

  Animal::Bat.new

  module BaseballUtensils
    class Bat
      def made_of
        "wood"
      end
    end
  end

  BaseballUtensils::Bat.new
  
```
---

##Inheritance vs Mixins
###What's the difference?

* Inheritance (class SomeClass < OtherClass) is used to _inherit_ the methods from one class into another class
* include/require (include SomeModule) is used to _import_ the methods from one module into a class/file
* can Inherit from only one class, can mixin bits from lots of modules

---

##Modules vs Mixins
###What's the difference?

* Mixins are added to classes to expand their functionality
* Modules can be used as Mixins (by being included in a class) or can just be imported into a file 
* A module is like a class, except
	* You cannot create a new instance of a module
	* You cannot extend a module to create a child module
	* Modules are a way to add namespaces



###Schedule

| Time        | Topic| Materials |
|:-------------|:---------|:----------|:-------------------|
| 40 min | Class Methods and Variables | demo_class_methods.rb (20 min) |
| 90 min | Inheritance | demo_inheritance_polygon.rb <br> ex_inheritance_office.rb| 
| 30 min | Modules Mixins | demo_mixin.rb | 


###Still Feel Lost?

Its ok, we will see these terms again in Rails, but you can also,

####Catch Up With These Resources

*	[Modules](http://marakana.com/bookshelf/ruby_tutorial/modules.html
)
*	[Mixins](http://samwho.co.uk/blog/2011/09/12/ruby-mixins/)



