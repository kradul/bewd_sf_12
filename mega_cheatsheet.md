#A Cheat Sheet File to rule them all


#### Rails Command Line Interface:

Rails New:

(new rails app)

```
rails new HelloWorld
```

Rails Generate:

(create models and controllers)

```
	rails g model ModelName attribute_name:type attribute_2:type
```
*	Use spaces to separate attributes. If you don't list a migration_type (text, integer, float, etc.) the default will be string.


Rails Server:

(start the rails server,)

```
rails server 
```

RAKE: 

Rake is a rails utility tool that runs various commands. The most common one is db:migrate which updates the database with new tables or columns etc.

```
rake db:migrate
```

Populate the database with seed data (from config/seeds.rb file)

```
rake db:seed
```

##Routes:
How to set where requests go (esp home page).

```
config/routes.rb
```

List of possible paths:

```
http://localhost:3000/rails/info/routes
``` 

Create a bunch of paths (show, edit, update, new, create, delete etc)

```
resources :movies
```

##Ruby code in html

```
		<% @games.each do |game| %>
			<%= game %>
		<% end %>

		<% 1 + 1 %> // won't show
		<%= 2 + 2 %> // will show!
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


## Debugging your code with pry in rails
####Installing bundle pry
*	Install the gem:
	* sudo gem install pry
*	Open the Gemfile (a file inside your rails app at the top level)	* nano Gemfile (or feel free to open it in sublime or any other editor)
*	Add the following to the Gemfile:
	*	gem pry
*	bundle install
*	add "require 'pry'" at the beginning of your file as before and then use "binding.pry" as always. NOTE: don't be confused if your webpage takes forever to load...it might be stuck on a breakpoint, check your terminal!! (the window that is running the server)




## Models & Active Record


####Migrations

__Migrations__

*	Forgot an attribute / field in your model? Create a migration
	*	Code below adds a field called ratings to the Movies model.

```
	rails g migration AddRatingToMovies rating:integer
```

__Seed Files__

*	Populating an entire database with the console would take a while. Use the seeds.rb file.

```
rake db:seed
```

__Drop The Database__

*	_You will loose your data if you do this._

```
	rake db:drop
```

__Drop database, run migrations, run seeds__

```
	rake db:reset
```

####Active Record

__Create__

	```
		Movie.create(title: "Jaws")
	```

__Read__

	```
		Movie.find_by title: "Jaws"
	```
	
	```
		# Find by ID
		Movie.find(1)
	```
	

	```
		# Returns all movie objects in an array.
		Movie.all
	```

__Update__

	```
		jaws = Movie.find_by title: "Jaws"
		jaws.update description: "Big Shark, bites people"
	```

__Delete__

	```
		jaws.destroy
	```

####Rails console
Execute Active Record queries on the DB and other small taks. It's basically irb for rails!

```
	rails console
```


####Access DB directly
Use SQL commands to directly query the database

```
	rails dbconsole
```

---

##Validations

__Validate Presence__

*	Validates that title, description and year_released, rating are not empty.
*	
``` 
validates :name, :description, presence:true
```

__Validate Length__

*	Validates that all descriptions are a minimum of 10 characters.

``` 
validates :description, length: { minimum: 10 } 
```

__Numericality__

``` 
validates :year_released, numericality: { only_integer: true }                   
validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5, only_integer: true }
```

__Checks if a record is valid__

``` 
movie.valid?
```

__Show current errors in an object__

*	Shows all of the current errors on an object

``` 
movie.errors
```

##Strong Parameters

``` 
def create                                                                       
  shirt_params = params.require(:shirt).permit(:name, :description, :image)   
  shirt = Shirt.create(shirt_params)                                             
  redirect_to shirt                                                              
end                  
```

## Associations 

Adding an association to an existing model, in the migration file:

```
add_reference :movies, :genre, index: true
```


###__belongs_to__

A Comment belongs to a Story (a comment has one story and the comments table in the database should have a story_id column).

__In the migration:__

```
class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
   	  t.belongs_to :story

      t.text :story
      t.timestamps
    end
  end
end
```

__In the model:__

```
class Comment < ActiveRecord::Base
	belongs_to :story
end
```


###__has_many__

__In the model:__

```
class Story < ActiveRecord::Base
	has_many :comments
end
```

Nothing in the migration!


###__has_and_belongs_to_many__

This association is for creating a many-to-many relationship, just like has_many :through, but without using a in-between model.

__In the model:__

```
class Category < ActiveRecord::Base
	has_and_belongs_to_many :stories
end

class Story < ActiveRecord::Base
	has_and_belongs_to_many :categories
end
```

__In the migration:__

```
class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    create_table :categories_comments do |t|
      t.belongs_to :category, index: true
      t.belongs_to :comment, index: true
    end
  end
end
```

NOTE: The intermediary (join) table MUST be called "categories_comments". The rule is both tables (plural) in alphabetical order! If you don't follow this rule (and don't use other syntax to specify a specific other table) rails will not work it's magic for you. (Rails is a picky, but powerful master...)



