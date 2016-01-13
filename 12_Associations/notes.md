#BEWD - Associations in Rails

---


##Agenda




##Associations
###Definition

Model associations are how models interact with each other. 

---


##Associations
###Rails Active Record Associations

__belongs_to__

__has_many__

__has_and_belongs_to_many__

__has_many :through__

_has_one_

_has_one :through_


---

##How to: Associations in Rails

Associations have two important pieces:
	* Model
	* Migration

Editing the Model creates the association in Rails, it allows you to access associated data through the model. For example ```alice.stories``` will give you all the stories that the user, alice, has written.

Editing Migrations creates the association in the Database. This is where columns need to be created. Not every association requires the creation of a column so not every association needs a migration. 

---

##__belongs_to__

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

Typically, you can use ```rails generate``` to create a new model (and the corresponding migration file) and then go in and manually edit it to include associations. Make sure to create models+migrations for all tables involved in the association before trying to migrate the database. In this example, there should already be a Story model (and table in the DB) before running this migration.

__In the model:__

```
class Comment < ActiveRecord::Base
	belongs_to :story
end
```

This code allows us to access the story that a comment belongs to from the comment object:

```
comment_id = 1
c = Comment.find(comment_id)
c.story 

=> Story Load (10.6ms)  SELECT "stories".* FROM "stories" WHERE "stories"."id" = ? ORDER BY "stories"."id" ASC LIMIT 1  [["id", 1]]
=> #<Story id: 1, title: "Open-plan offices make employees less productive, l...", link: "http://qz.com/85400/moving-to-open-plan-offices-mak...", upvotes: 1, created_at: "2016-01-12 21:16:52", updated_at: "2016-01-12 21:16:52">
```

NOTE: "belongs_to" requires a SINGULAR object as a reference ("user" NOT "users"). Rails won't be able to find the right model to connect to if you pluralize incorrectly.

Right now, the comment has an association to the story, but there is no way to get all the comments that a story has (except by using ```where``` and searching the stories table for matching user_ids.) Here's how to fix that:

---

##__has_many__

__In the model:__

```
class Story < ActiveRecord::Base
	has_many :comments
end
```

NOTE: unlike "belongs_to", "has_many" requires a PLURAL object reference for rails to work its magic.

Now you can access all the comments a story has (in an array containing a list of story instances) like this:

```
story = Story.find(1)
story.comments
=>  Comment Load (0.3ms)  SELECT "comments".* FROM "comments" WHERE "comments"."story_id" = ?  [["story_id", 1]]
=> #<ActiveRecord::Associations::CollectionProxy [#<Comment id: 1, user_id: nil, story_id: 1, post: "haha", created_at: "2016-01-12 21:18:57", updated_at: "2016-01-12 21:18:57">, #<Comment id: 2, user_id: nil, story_id: 1, post: "lol", created_at: "2016-01-12 21:19:55", updated_at: "2016-01-12 21:19:55">]>
```

__In the migration:__

NONE! Notice no migration code is necessary because we don't need to add columns to any tables.

---

##__has_and_belongs_to_many__

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

Now you can find the stories that a category has or the categories a story has using model properties. And more importantly you can edit those and rails will save them to the database using this intermediate table "categories_comments".


```
cat = Category.Create(name: "cats")
cat.comments
=> []
lol = Comment.Create(comment: "lol")
cat.comments.push(lol)
cat.comments
=> [Comment<lol>] #this would look a little different in an actual console, it's easier to read this way
```

And now the categories_comments table looks like this:

```
id | category_id | comment_id
1 | 2 | 4
```

Where 2 is the id of the "cat" category and 4 is the id of the "lol" comment.

---

##When to use has_and_belongs_to_many vs has_many :through

Use has_and_belongs_to_many for a many-to-many relationship that does NOT need an intermediate model, for instance Comments and Categories. There's no practical use for a CommentCategory model so leave it out!

Use a has_many :through if there is a practical use for the intermediate model (ex. that model should store some of its own attributes). For example: a Courses has many Students and a Student has many Courses, and it might make sense to link them through Assignments. Assignments have their own properties like "score" or "due_date" so they deserve their own model. Remember to create all the necessary associations between Student and Assignment and Course and Assignment before attempting to create the Student to Course association. (ie. Student ```has_many :assignments``` AND Assignment ```belongs_to :student```). 

---

##Adding associations to existing models

For the changes in the model, it's just like creating an association on a new model.

For the changes in the database, it's just like adding a new column to the table. Or for a many-to-many relationship it requires adding a new table. Feel free to use ```rails generate migration CreateCategoriesComments``` for example, to create an empty migration and add you own code to create a new table (as above).

---

## MovieApp with Associations
movie_associations.md
MovieApp_Associations

---

## Homework

Project Milestone, Due Tuesday 1/19: 

*	Narrow down your project ideas to one final idea
*	For the following, don't worry about getting it perfect, we will iterate on these ideas:
	*	Think about User stories (who/how/why is someone using this?)
	*	List all models needed for your final project. 
	*	Draw a diagram to show how they will be associated. (Include Users!)

---

## Cheat Sheet

If you get an error about different versions of rake (```Gem::LoadError: You have already activated rake 10.4.2, but your Gemfile requires rake 10.0.4```) when you try to migrate, try this:

```
$ bundle update rake
```

---

###Updating Associated Model's properties

It's possible to update properties of another model using accepts_nested_attributes_for. Check out the [docs](http://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html)


<div id="resources">
## Resources


###Tips, Tricks & Advanced Reading

* [Nested Routing](http://guides.rubyonrails.org/routing.html#nested-resources)

*	[Rails Naming Conventions](http://itsignals.cascadia.com.au/?p=7)

*	What's The Difference Between has_one and belongs_to - [Stack overflow](http://stackoverflow.com/questions/3808926/whats-the-difference-between-belongs-to-and-has-one belongs_to vs has_one)

*	Advanced Rails Forms and nested attributes - [tutorial](http://rubysource.com/complex-rails-forms-with-nested-attributes/)

http://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html


###Still Feel Lost? 
####Catch Up With These Resources

*	[Michael Hartl Chapter 10](http://ruby.railstutorial.org/chapters/user-microposts#top)


*	[Associations Tutorial](http://net.tutsplus.com/tutorials/ruby/active-record-the-rails-database-bridge/) 


*	[Rails Guides - Associations](http://guides.rubyonrails.org/association_basics.html)


*	[Differences in primary and foreign keys](http://www.programmerinterview.com/index.php/database-sql/differences-between-primary-and-foreign-keys/ Primary and Foreign keys)
