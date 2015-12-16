
##Lesson 7: My First Rails App


*	During the Rails portion of the class we will share exercise instructions in markdown files and solutions will be full Rails apps.

###Learning Objectives

*	Define how DNS servers, web servers and web browsers work together to deliver a Rails app.
*	Describe HTTP URI structure and Rails request handling cycle.
*	Define framework and explain how Ruby works with Rails.
*	Create a basic Rails application using scaffolding.
*	Review Rails application file structure.

###Schedule


| Time        | Topic| Materials|
| ------------- |:-------------|:-------------------|:-------------------|
| 30 min | Rails 4 installation | | 
| 15 min | What is Rails? | | 
| 40 min | How the Internet works | ex_draw_internet.md | 
| 20 min | First Rails App | | 
| 20 min | MVC & Scaffolding | | 
|  | Lab Scaffolding | ex_users.md | 


###Homework
Due next Thursday. See Homework folder. It's a review of materila we learned in Ruby, especially classes and inheritance.


###Resources

* Article on howstuffworks about webservers and requests: [How a request works](http://computer.howstuffworks.com/web-server2.htm)
* Getting started with rails: [Ruby on Rails Guide](http://guides.rubyonrails.org/getting_started.html)


#### Rails Command Line Interface Cheatsheet:

Rails New:

(new rails app)

```
rails new HelloWorld
```

Rails Generate:

(create models and controllers)

```
rails generate controller Hello
```

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
