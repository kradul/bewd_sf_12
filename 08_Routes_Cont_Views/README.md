
![GeneralAssemb.ly](../assets/ICL_icons/instr_agenda.png)


##Lesson 8: Routes, Controllers & Views


###Learning Objectives


*	Explain the MVC structure and differentiate between views and controllers. 
*	Describe the request reponse cycle and the flow of control in a Rails app.
*	Generate a controller with a view.
*	Identify where to put css and JavaScript files.



###Schedule


| Time        | Topic| GA ICLS| Comments |
| ------------- |:-------------|:-------------------|:-------------------|
| 60 min | Routes | [Games On Rails](instr_code_demo_notes.md)| Games on Rails is the only rails app for this lesson.| 
| 30 min | Controller | Games On Rails  | |
| 30 min | Views | Games On Rails | |
| 60 min | Lab Time | Games On Rails (add [Rock Paper Scissors](instr_exercise_notes.md)) |Students add the game rock paper scissors to games on rails. |



###Cheat Sheet:
Create a new controller and corresponding views:

```
rails generate controller <Name> <method1> <method2> ...
```

Destroy a controller (in case you made a mistake creating it):

```
rails destroy controller <Name>
```

Ruby code in html:

```
		<% @games.each do |game| %>
			<%= game %>
		<% end %>

		<% 1 + 1 %> // won't show
		<%= 2 + 2 %> // will show!
```

Routes:
How to set where requests go (esp home page).

```
config/routes.rb
```

Make a link:

```
link_to ("text of link", "path of link ")
```

Make an image:
Remember the starting folder is in "app/assets/images"

```
image_tag ("path of image ")
```


List of possible paths:

```
http://localhost:3000/rails/info/routes
``` 

Variables passed to controller:

```
params
=> {"controller"=>"secret_number", "action"=>"show", "format"=>"4"}
```


### Debugging your code with pry in rails
####Installing bundle pry
*	Install the gem:
	* sudo gem install pry
*	Open the Gemfile (a file inside your rails app at the top level)	* nano Gemfile (or feel free to open it in sublime or any other editor)
*	Add the following to the Gemfile:
	*	gem pry
*	bundle install
*	add "require 'pry'" at the beginning of your file as before and then use "binding.pry" as always. NOTE: don't be confused if your webpage takes forever to load...it might be stuck on a breakpoint, check your terminal!! (the window that is running the server)


##Resources
* A good overview of ruby on rails, also MVC: [Getting Started](http://guides.rubyonrails.org/v3.2.13/getting_started.html)
* A discussion of routing : [Routing](http://guides.rubyonrails.org/routing.html)


