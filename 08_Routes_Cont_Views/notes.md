

##Lesson 8: Routes, Controllers & Views
##NOTES


###Learning Objectives


*	Explain the MVC structure and differentiate between views and controllers. 
*	Generate a controller with a view.
*	Identify where to put css, JavaScript, and image files


##The Dispatcher
###routes.rb

*	Located at config/routes.rb
*	Connects URLs to code
	* Used for mapping urls to your code
*	You can customize your routes, or rails creates a lot of default ones for you
*	Current Routes: $ rake routes
	*	Rails 4: Can be seen at http://localhost:3000/rails/info/routes

---

##MVC

##Controllers

* 	Controllers are also classes, like any other.
*	A NEW controller is created for EVERY request!
*	Responsible for parsing user request
*	It can do some logic, render a view, redirect to another view or send an error message.
*	Contains actions (aka functions)

---
###Methods

* However, methods inside a controller are not like any other method; they are special (called Controller Actions)
* A Rails action gets invoked when a route matches to that controller/action combination
* Note: a private/protected method in a controller is NOT an action (you cannot hit that method via a URL). You can use private/protected methods to have helper methods inside a controller without being actions.
* Note: "new" method on the controller is NOT the same method that creates a new controller (Controller.new)

---
###Params

*	http://localhost:3000/games/secret_number/7
*	7 is a param, called id, based on URL convention in the routes

---

##MVC
###Controller to Views

*	By default your controller renders the view named controller_name/action_name.html.erb
*	Possible to render a differen view, using "render" method

---

##Views
###html.erb

*	Can write html
*	Can write pure ruby.
*	DON'T write a lot of ruby logic in the view! Keep your views simple, logic should go in the Controller (or Model, we'll talk about that more later)

		<% @games.each do |game| %>
			<%= game %>
		<% end %>

		<% 1 + 1 %> // won't show
		<%= 2 + 2 %> // will show!

---
###application.html.erb

*	All views are wrapped inside application.html.erb
	*	It loads the assets
	*	sets up the meta tags, titles etc...
	*	You can render no layout Or a different layout

---
###Assets Folder

* Keeps javascript files, stylesheets, and images
* Include an image using 'image_tag' method:
	* <%= image_tag 'games/loser.gif' %>
	* path: "assests/images/games/loser.gif" (in your app folder)
---

##Code-Along

###Generate controllers:

```
rails generate controller Game index
rails generate controller SecretNumber new show
```
---

###Change home page:
Change routes in config/routes.rb to route to the GameController index view:

```
root "game#index"
```
---

###Edit a view and create a link
Let's edit the view to make it prettier, and create a link to the Secret Numbers game (new action).

```
link_to("Text of link", "path of link")
```

Check out ```http://localhost:3000/rails/info/routes``` for a list of possible paths!!

---

###Ruby Code in HTML
Edit the Secret Numbers new view to have links to 5 numbers you can choose.

Note the difference between ```<%``` and ```<%=```. The one with ```=``` is like a return statement, it will print the result to the HTML page. The other is just for ruby code that doesn't need to return anything. Need separate tags for separate lines of ruby.

---
###Params
You can pass variables along with the request as additional parts of the url. For example:
```http://localhost:3000/secret_number/show.3``` 

The controller's request gets a set of params. By default the first parameter is called ":format". If you forget check out the list of routes again: "http://localhost:3000/rails/info/routes".

Any instance variables in the controller automatically get passed to the view. You can access them in the view like this:

```
<%= @variable %>
```
---
###Game Logic
Game logic should go in the Controller not the View! Let's code the logic for Secret Number. Pass result of logic to the view.

---
### Adding Images:

Remember the starting folder is in "app/assets/images"

```
image_tag ("path of image")
```
---

A couple more steps:
*	Add link to play again
*	Add some more images
*	Add link back to game controller using application.html.erb 
	* use ("controller.controller_name")

---

##Exercise: Rock Paper Scissors
*	rock_paper_scissors.md

---

