
#NOTES - Models & Active Record

##Learning Objectives


- Describe a models function in the MVC framework. 
- Define Rails migration and apply rake db.
- Implement migrations to update database tables.
- Operate ActiveRecord to save and access model data.


##Agenda
*	Models
	*	Databases
	*   Generating Models
	*	Migrations
	*	seeds.rb
*	Active Record
*	Lab Time

---

##Models
### Talking to the database
* 	Models are needed to talk to the database
* 	We need to use the database to store *persistent* data (lives beyond a request lifecycle)
* 	Models simplify the task of working with a database
* 	Each model is used to talk to a specific table (e.g. User model for Users table)
* 	Rails models have special functionality to allow you to easily lookup data from the table, or make changes without having to use SQL directly

---


##Database
###Permanent Data

*	Permanent store for data (lives beyond a single request)
*	Designed to handle data at scale (lots of data)
*	Many different databases we can choose from, Rails handles almost all of them.


---

##Database
###Standard data types

* Text
* Numbers
* Dates / Times
* Booleans

---

##Database
###Tables

*	A database is made up of a collection of tables. 
*	Tables contains rows (data) and columns (properties of each piece of data)

---

##Database
###SQL

SQL: Structured Query Language
A programming language used to search and save data to databases.

	SELECT "movies".* FROM "movies" WHERE "movies"."title" = 'Jaws' LIMIT 1

---


##Model
###Code Along: Shirts

Shirt Management app is an application we will build incrementally during class.

The app allows users to manage their T-Shirts collection, by adding and deleting shirts to the database.

For this lesson we will add a basic T-Shirt Model.

---


###Shirt Management

Let's Add a T-Shirt Model.

---

###Create a new model


		rails g model Shirt name:string description:text

NOTE: model doesn't have these attributes, they are automatically assumed in Rails (don't worry, they exist)

You can add data validations here if you want. Ex:

```
class Shirt < ActiveRecord::Base
  validates :name, :description, :size, presence: true
  validates :description, length: { minimum: 10 }
  validates :size, inclusion: { :in => ["S", "M", "L"] }
end
```

---

###Rake

	rake db:migrate

---

###Rake

*	Task runner for ruby
*	Used to:
	*	Run Migrations
	*	Seed your database

---

##Shirt Management

*	Add size field to database

---

###Migration

* Can add fields / columns to existing tables

		rails generate migration AddSizeToShirts size:string
			
* Can remove 

		rails generate migration RemoveImageFromShirts image:string

* Can do a bunch of other things like add/remove tables, create connections between tables, change column types etc

---

###Migration File:

```
class AddSizeToShirts < ActiveRecord::Migration
	def change
		add_column :shirts, :size, :string
    end
end
```

---

##Migrations
###What can you do in a migration?

* Adding/removing columns from a table
* Modifying columns on a table
* Adding/removing tables

---

###Seeds

*	Fast and easy way to add data to your tables
*	Place a `seeds.rb` file into your `db/` folder
*	Run `rake db:seed`

Copy all data from custom seeds file to the seeds.rb file:

```
	$ cat shirt_seeds.rb > seeds.rb
```

---

###Active Record

*	Rails has a library called ActiveRecord to help Models talk to the database.
*	Thus, Rails models are called ActiveRecord models.
*	While ActiveRecord makes it easy to avoid SQL almost entirely, it's still valuable to know some SQL. Later in your development path, you will want to know which queries are more/less efficient so you can optimize them. For now though, we can enjoy the super-simple syntax of ActiveRecord to talk to our database.

---

###Active Record & Rails console

Open up rails console:

```
	$ rails console
```

Then can run Active Record commands in it:

Create

	Shirt.create(name: "White Tee")

Read

	Shirt.find_by(name: "White Tee")

Update

	my_shirt = Shirt.find_by(name: "White Tee")
	my_shirt.update(description: "GA white T-Shirt")

Delete

	my_shirt = Shirt.find_by(name: "White Tee")
	my_shirt.destroy()

---

##Models
###Summary
*	We want to store our data in a persistent manner, so we need databases.
*	Communicating with databases in SQL is complex, so we use ActiveRecord models to help us.
*	ActiveRecord models are just Ruby Objects, so we can call methods on them and pass them around like any other object.
*	Each Model *class* maps to a database table
	*	`>> User.all`
	*	`>> User.create first_name: 'Salman'`
	*	`>> User.find(1)`
*	Each Model *instance* maps to a single record in a table in the database
	*	`>> user = User.find(1)`
	*	`=> #<User:0x007fcf8e9eebd8>`
	*	`>> user.id`
	*	`=> 1`
	*	`>> user.update last_name: 'Ansari'`

---

##MVC
###Model View Controller

*	The controller interacts with the Model
*	The controller renders the view, passing it Model data (using instance variables)
*	The view and the model do not interact (need the controller)

---


##MVC
###Controller

*	Controller interacting with the model

__shirts_controller.rb__

		@shirts = Shirts.all #Returns an array of Shirts (array of Shirt instances)

---

##MVC
###Controller

*	Controller interacting with the view

__shirts/index.html.erb__

		#Can be used in the view
		@shirts

---


## Homework

Complete and submit the Movies app - Movie Model(due lesson 11)

---

<div id="resources">

## Resources: Models & Active Record

###Cheat Sheet

####Create Models

```bash
	rails g model ModelName attribute_name:type attribute_2:type
```
*	Use spaces to separate attributes. If you don't list a migration_type (text, integer, float, etc.) the default will be string.

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



