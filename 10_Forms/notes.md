#Notes
#BEWD - Forms & Validations

---


##Agenda

*	Review
*	Forms
	*	Search Forms, Create Forms, Partials
*	Validations
*	Lab Time

---
##Review
###Routes, Model, View, Controller

* Routes define which request URL maps to which Controller/Action pair (which method on the controller), use this to edit homepage (root)
* MVC diagram
	* Controller acts as go-between for view and model, handles requests (```rails generate controller Shirt index new```)
	* View displays info
	* Model stores data and communicates with Database (```rails generate model Shirt name:string description:text```)
* Database and Model (ActiveRecord)
	* Model class => table in DB
	* Model instance => row in DB
	* after creating model, DB needs to be updated to match ```rake db:migrate```
	* populate DB by creating model instances in the db/seeds.rb file and running ```rake db:seed```
	* use ```rails console``` to try out ActiveRecord commands (use ```rails dbconsole``` to execute SQL directly)

---

###Partials

*	File name starts with an underscore (this is NOT a style convention, rails requires it.)
*	Inserted into page using the "render" keyword
*	Have access to instance variables
*	Forms are great candidates for partials
*	Rails magically handles the methods for us if we use model objects

---

### Partials: Demo
Use a partial view to display the list of shirts.

```
<%= render "list" %>
```

---

##Forms
###Adding Forms to Views

*	Used to 'GET' user input

---

###Shirts Management App - Search Form: Code-along

As a user I want to be able to search for a specific T-Shirt in my collection.

##Add the form

```
<%= form_tag "/", method: "GET" do %>
  <%= text_field_tag :q, params[:q] %>
  <%= submit_tag "Search" %>
<% end %>
```

```form_tag``` creates a new form, parameters: URL where form gets submitted to, request method (optional, defaults to POST)

```text_field_tag``` creates a new text field (check out [docs](http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html#method-i-form_tag) for more types of inputs you can create). Parameters: name of input when submitted, optionally: text to put in the field

In this example, when the user submits this form, the request will be sent off with this data: "{q: 'my shirt'}" where ':q' is the key and 'my shirt' is what the user searched for. When the request returns this page will come up again with the results, this time ```params[:q]``` will be 'my shirt' so the search box will say 'my shirt' and display the results.

```submit_tag``` creates a submit button, takes an argument of what text to display on the button.

---

## Edit the behavior of shirt controller and model

Edit the index method to be able to filter by a search term, instead of displaying all shirts at all times.

```
  def index
    @shirts = Shirt.search_for(params[:q])
  end
```

Remember most of the logic should go in the model!

###Queries

*	Search database with the keywords "where" & "LIKE"
	
		where('name LIKE :query OR description LIKE :query', query: "%#{query}%")	
*	Searches the Shirt table's name and description fields.


Moving on to the model:

```
  def self.search_for(query)
 	Shirt.where('name LIKE :query OR description LIKE :query', query: "%#{query}%")
  end
```

* ```where``` replaces :query in the querystring with the value of the second argument (keyed ":query") (this is a built-in ActiveRecord method)
* always use this replacement, never allow query parameters to be executed on the database directly, it's a sercurity risk
* ```LIKE``` in SQL uses pattern matching (```=``` searches for exact matches only)
* ```%``` is a wildcard so you can search for names or descriptions that contain the search term (as opposed to equalling exactly or starting/ending with it)
* The rest is your familiar old ruby string interpolation "#{query}"

---

##Recap
###Search Forms

When a user clicks 'Search'

1.  Goes to the Shirts controller index action. 
2.  Sends the query as a querystring parameter (params[:q])
3.  Filters results by the query
4.  Searches shirts by name or description fields

---
## Routes
Use ```resource: shirt``` as a shortcut for producing routes (Create Update Delete Read) for a resource.

---

##Exercise: Movie App - Search

*	Create a search box that will search for a term in the movie's title, description and the year
*	Create a partial to list the movies (just like with the Shirts app)
*	Move all complex data queries to the model

---


##Forms
###Adding to Database

*	We saw how a user can search the database with a form, but how does a user add to the database using forms?

---

###Code-Along: Shirt Management App - Create & Edit Forms

*	As a user I want to add shirts to the database.
*	As a user I want to edit shirts. 

---

###Form Partial
Creating and Editing shirts would use very similar HTML, so let's make a partial for them to share!

Create _form.html

```
<%= form_for @person do |f| %>
  <%= f.label :first_name %>:
  <%= f.text_field :first_name %><br />

  <%= f.label :last_name %>:
  <%= f.text_field :last_name %><br />

  <%= f.submit %>
<% end %>
```

Creates this HTML:

```
<form action="/people" class="new_person" id="new_person" method="post">
  <input name="authenticity_token" type="hidden" value="NrOp5bsjoLRuK8IW5+dQEYjKGUJDe7TQoZVvq95Wteg=" />
  <label for="person_first_name">First name</label>:
  <input id="person_first_name" name="person[first_name]" type="text" /><br />

  <label for="person_last_name">Last name</label>:
  <input id="person_last_name" name="person[last_name]" type="text" /><br />

  <input name="commit" type="submit" value="Create Person" />
</form>
```

When submitted the result would be:

```
{ person: {first_name: 'Joe' last_name: 'Smith'} }
```

If the ```@person``` object was empty this would create a blank form (for creating a new user). Otherwise the form would already contain the data existing in this person (for editing this person).


```form_for``` creates a new form. The ```f``` variable represents a FormBuilder object that has useful methods for creating form inputs like label, text_field and submit (and many more!).

Remember the parameters passed to the form builder methods must match the names of the properties on the ```@person``` object.

---


###Strong Parameters

*	Rails Controllers require you to whitelist which fields a form can send
*	Used to protect from nasty attacks. Github got bitten by one a while back.

```
def safe_shirt_params
  params.require('shirt').permit(:name, :description, :image)
end
```

---

###Controller creates a shirt
Uses safe_shirt_params to make sure no sneaky user data is inputted directly into the database.

```
  def create
    @shirt = Shirt.new(safe_shirt_params)
    if @shirt.save
    	#if the shirt was successfully saved, redirect to the show shirt page
      redirect_to @shirt
    else
    	#if the shirt wasn't successfully saved, render the "new.html" view (allow user to edit it and try saving again)
      render 'new'
    end
  end
```

---

###Validation

*	Ensures that we are saving accurate information in the database. 
	*	If our validation fails, don't add record to the database table
	*	If our validation fails let the user know it failed.


Rails has built in methods for ActiveRecord models, ex save. Save will attempt to save the record objects to the database. If it succeeds it will add a new row to the database representing this data. If it fails, it will add error messages to the model (ex shirt.errors). Save checks the data against the validations to determine if it's ok to save the model to the database.

---
### Displaying errors in the view 

```
<% if @shirt.errors.any? %>
  <h2>There were errors saving your shirt</h2>
  <ul>
    <% @shirt.errors.full_messages.each do |msg| %>
      <li><%= msg %></li>
    <% end %>
  </ul>
<% end %>
```

---

### Private methods

*	Not routable, or callable from the outside world
*	Good to use for things like checking the parameters and loading a specific resource

---
### Controller Actions: before/after
Controllers can execute methods before or after calling an action. This is useful if you want to execute a particular shared method before many different actions or if you need to run a particular check before executing the action (ex checking if the user is logged in). Here's an example:

```
before_action :load_shirt, only: [:edit, :show, :update]
```

Here the controller executes "load_shirt" before the "edit", "show" and "update" actions only. This makes sense because we want the controller to load a specific shirt only for these actions.

---

###REST

*	REpresentational State Transfer
*	:resources in the routes file gives us LOTS (7) of routes
*	Perfect for managing "Resources" (Things in your domain, like Shirts and Movies)

---

##Exercise: Movie App

---


<div id="resources">
## Resources: Forms & Validation

###Cheat Sheet

####Reload Code in Console

*	Reloads freshest code in the console

``` ruby
reload!
```

####Validations

__Validate Presence__

*	Validates that title, description and year_released, rating are not empty.
*	
``` ruby
validates :name, :description, presence:true
```

__Validate Length__

*	Validates that all descriptions are a minimum of 10 characters.

``` ruby
validates :description, length: { minimum: 10 } 
```

__Numericality__

``` ruby
validates :year_released, numericality: { only_integer: true }                   
validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5, only_integer: true }
```

__Checks if a record is valid__

``` ruby
movie.valid?
```

__Show current errors in an object__

*	Shows all of the current errors on an object

``` ruby
movie.errors
```


####Strong Parameters

``` ruby
def create                                                                       
  shirt_params = params.require(:shirt).permit(:name, :description, :image)   
  shirt = Shirt.create(shirt_params)                                             
  redirect_to shirt                                                              
end                  
```


#### Private methods

*	Not routable, or callable from the outside world

```ruby 
class MyClass 
	def call_me 
		puts "Called" 
	end 
	private 
	def maybe 
		puts "Forever Alone" 
	end 
end 
```


###Still Feel Lost? 

This course focus was on forms. You should have a general understanding of form builders and what happens when using a search form. 

####Catch Up With These Resources

*	[Form Tags](http://edgeguides.rubyonrails.org/form_helpers.html) about the different tags here and [here](http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html)

*	[Form Helpers](http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html)	

