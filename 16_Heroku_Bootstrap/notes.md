
#BEWD - Heroku and Bootstrap

---


##Agenda

*	Deploying to Heroku
*	Front-End Frameworks
*	Exercise: "Stuff Finder"

---

##Front - End Frameworks
###Twitter Bootstrap

*	Built @ Twitter by two employees (@mdo and @fat)
*	Managed through GitHub
*	Great css components
*	add quick and easy styling to a Rails app

---


##Heroku
###Platform as a Service

*	Pronounced her-OH-koo
*	Founded in 2007 by Orion Henry, James Lindenbaum, and Adam Wiggins.
*	Cloud application platform 
*	Allows free app deployment, and server management.

---

##Postgres - Heroku's database

*	Heroku requires postgres, but we have been using sqlite as our database
*	Heroku is considered a production (ie user-facing) environment, and our computer is a development (and testing) environment.
*	options:
	*	configure your app to use postgres from the beginning (easiest!)
	*	configure app to use postgres in production and sqlite in development (not recommended)
	*	switch your app use postgres in development (even though it was originally using sqlite)

---

##Installing Postgres

Download the Postgres app for mac OS, http://postgresapp.com/

Then:

```
$ gem install pg -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/9.5/bin/pg_config
```

-------------
##Create Heroku Account

Create a Heroku user account at: https://signup.heroku.com/devcenter

-------------
##Setup Heroku tools

Install heroku toolbelt for mac:

https://toolbelt.heroku.com/

This includes a command line interface for Heroku!

-------------
##Setup Heroku in Terminal

```
$ heroku 
```

Then use your account info from Heroku to login. If prompted, create a new ssh key (for pushing code to heroku later).

```
$ heroku login
```

----------
##Creating a new postgres app

```
rails new myapp --database=postgresql
```

Optional (recommended)
Add to Gemfile:

```
gem 'rails_12factor', group: :production
```

And run bundle install.

This gem makes it easy for your app to remain compliant with any configuration changes heroku makes.

----
##Setting up git

Your app needs to be a git respository to be deployed to heroku. 

!!! Make sure your app is not inside another repository !!!

In your app folder:

```
$ git init
$ git add .
$ git commit -m "init"
```

---
##Creating Heroku Remote

To have git push to heroku we need heroku to be a registered remote for this repository (kind of like "upstream" and "master".)

```
$  heroku create
```

Verify remote was created:

```
$ git config --list | grep heroku

remote.heroku.url=https://git.heroku.com/still-plateau-66403.git
remote.heroku.fetch=+refs/heads/*:refs/remotes/heroku/*
```

Make any changes you want, in particular you should create a homepage. Then commit again. (git status, git add ., git commit -m "added homepage")

---
##Pushing to Heroku


```
$ git push heroku master
```

Now your app is on heroku and visible to the world!! (but we're not ready to look at it yet) Remember "git pull upstream master", "upstream" is the remote and "master" is the branch, here we're pushing and the remote is heroku!

---
##Migrate Heroku's database:

```
$ heroku run rake db:migrate
```

The database on heroku hasn't been set up (it's a different database) so you need to migrate and possibly seed.

----
##Open your app on heroku!

```
$ heroku open
```

It should open in your browser at something like "https://still-plateau-66403.herokuapp.com/" (some silly generated name).

----
##Rename your app (the free way)

```
$ heroku apps:rename mytastyapp
```

Now the url will be: https://mytastyapp.herokuapp.com/

To get rid of the "herokuapp" part of the url requires buying your own domain name (certainly a worthwhile investment for a public-facing project, but probably not while you are still testing things out.)

----




---
##Converting sqlite app to postgres

If you created an app already with sqlite, can move it to postgres by changing the 'sqlite' gem in the Gemfile to 'pg' (postgres) then make those changes take effect by running '$ bundle install':

#Gemfile

```
#gem 'sqlite'
gem 'pg'
```

Then:

```
$ bundle install
```

Also open config/database.yml file and make sure adapters are set to 'postgresql' for all environments (NOT 'postgres' or 'sqlite').

Example config/database.yml:

```
development:
  adapter: postgresql
  encoding: unicode
  database: myapp_development
  pool: 5
  username: myapp
  password:
```

NOTE: the database setting cannot have a extension the way it does with sqlite (ex. "myapp_dev.sqlite") 

Push your app to Heroku and manually migrate the remote database:

```
heroku run rake db:migrate
```

and seed:

```
heroku run rake db:seed
```
---

###PostgreSQL on production (sqlite on development)
(Not recommended)

#Gemfile

```
		group :development do 
			gem 'sqlite3'
		end
		
		group :production do
			gem 'pg'
		end
```

---

##Lab Time

Stuff Finder - starter_code/stuff_finder.md

---


---
##Heroku Cheatsheet:
###Create & Deploy

Create App

	heroku create --stack cedar [<appname>]

Deploy App

	git push heroku master

Open App in Web Browser

	heroku open

---


## Homework

1. Create the barebones of your project and deploy it to Heroku! (A static homepage)
2. Implement your database models and associations. Create all the models you anticipate needing, and create all associations both in ActiveRecord and in the database.
3. Submit a seeds.rb file that populates your database with some sample data and demonstrates how all of your models and associations work. 

---




<div id="resources">
## Resources


###Tips, Tricks & Advanced Reading


*	[Info-graphic](http://responsive.vermilion.com/compare.php) that compares different front-end frameworks.

*	Heroku [Cheat Sheet](http://ruten.ca/2012/02/15/heroku-cheatsheet-useful-heroku-commands-reference/)

*	Twitter Bootstrap [Documentation](http://twitter.github.io/bootstrap/)

*	Twitter Bootstrap [tutorial](http://webdesign.tutsplus.com/tutorials/workflow-tutorials/twitter-bootstrap-101-customize/).