##Lesson 7: My First Rails App


*	During the Rails portion of the class we will share exercise instructions in markdown files and solutions will be full Rails apps.
*	On a mac, Mou is a free program that displays markdown files


###Learning Objectives

*	Define how DNS servers, web servers and web browsers work together to deliver a Rails app.
*	Describe HTTP URI structure and Rails request handling cycle.
*	Define framework and explain how Ruby works with Rails.
*	Create a basic Rails application using scaffolding.
*	Review Rails application file structure.

##Outline:

###What is Rails?

* Framework for building websites 
	* What is a framework? A bunch of code that streamlines common tasks
* Open source, written in Ruby
* Websites built on Rails:
	*	Groupon
	*	GitHub
	*	Hulu
	*	__General Assembly__


###Draw The Internet

*	Get into groups of 2-3.
*	Draw a diagram that represents your understanding of how the Internet works. Here are a couple of questions to consider as you draw.
	*	What happens when you hit enter on your address bar?
	*	Where does a website live?

We will discuss how the internet works at a high level next.

###How request/response works:
URLs have three important parts:
*	The protocol ("http"), like what language you are using to talk to the server
*	The server name ("www.howstuffworks.com")
*	The file name ("web-server.htm")

(Don't worry too much about this step) DNS server takes the server name and finds the computer that matches (finds it's IP address) and sends your request to the correct webserver.

Server receives the request, tries to find the file "web-server.htm" and returns the result (either the file/webpage or a 404 File not Found error).

Your browser receives the server's response. The response probably contains a bunch of css, html and javascript, and renders it as a webpage for you.


###How does Rails fit in?

*	Rails makes writing code for a web server easy
*	takes care of a lot of tasks for you like
	*	routing - finding where on the computer the file is
	*	database management - websites store data
	*	requests & responses - handles the nitty gritty of receiving requests and returning responses
	*	structures application for you - provides a best-practice structure for your code based on the "Model View Controller" (MVC) paradigm (more details on this later!)

___

##Code-Along: First Rails App

###Make an app
```
	$ rails new my_app
	$ ls
	$ cd my_app
```


###Structure Of A Rails App
There are many folders, but almost all of the code we write goes in the app folder.

#### The app folder

Most of the code we write belongs somewhere in the `app` folder.

* `app/assets`: CSS, JavaScript and images used in templates.
* `app/controllers`: Classes which gather data and render responses for specific requests.
* `app/models`: Classes defining your data models (e.g.. User, Comment, Post).
* `app/views`: Templates called by your controllers to render HTML.
* `app/views/layouts`: Master templates to be used throughout your website.
* `app/helpers`: Utility modules which define methods for templates to use.
* `app/mailers`: Classes that define various outbound emails in your app.


###Start the server
Open a second terminal tab, make sure you cd into your new app folder then:

```
	$ rails server
```
(```$ rails s``` also works, it's shorter!)


###Check it out
Go to ```http://localhost:3000```

---

##Code-Along: Scaffolding

```
	$ rails generate scaffold Book author:string title:string abstract:text
```

*	Scaffolds provide the bare necessities for creating, editing, deleting, and viewing a resource. Otherwise known as CRUD.
*	Scaffolds are great when getting started with Rails or a new app, but are generally not used in production websites.
*	Scaffolding is not considered best practice, and should generally only be used initially as a means of learning (the primary drawback of using them is that you generate lots of code that you don't need, and it's difficult to undo).

```
	$ rake db:migrate
```

Now go to your browser and try this:

```
	http://localhost:3000/books
```

Play around with the interface, make some books, edit, delete them etc.


##How does this work in the code?
Check out the folders: controllers, models, and views in the app folder. Rails created files for you when you made the books!

## MVC Pattern

##### Models
- Models are where data interactions happen.
- Most logic related to pulling and saving to databases is here.

##### Views
- Views are what the users will actually see.
- It is the UI made dynamic through the templating engine.
- Views in Rails are served through layouts.

##### Controllers
- Controllers bridge the gap between models and views.
- They take requests and do something with them.
- One controller can have many methods relating to that specific logical concern.

##### Routes
- Like Node, routes take HTTP requests from a specific URL and hand them off to a specific controller and a specific method inside that controller.


##Exercise: User Scaffolding







