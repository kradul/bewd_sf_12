##Twitter App

The goal of this exercise is to review and solidify all your rails knowledge so far. This exercise is very minimally guided, the goal is to develop your skills to work independently. It will be very helpful to use examples we have done in class as a guide.

##Task Instructions
*	Create a new app from scratch, call it "twitter_app".
*	We have already outlined the future database associations for all our resources (users, tweets, and hashtags) but for now we will focus just on managing the resources and not on their associations

##Cheat Sheet
*	Remember to check all the cheat sheets (usually in notes.md or in the README files for all our rails classes 07-11)
*	__Use the examples we have already created together__ (ShirtsApp and MovieApp to guide you whenever you get stuck)

### Create models
* Create all models using rails generate (User, Tweet, Hashtag) Here are the properties and types each model should have:
	* User
		* name, string
		* premium_member, integer (later will add validation to make sure this can be only 0 or 1, sqlite doesn't have a separate boolean datatype)
	* Tweet
		* text, text
		* (later will have users and hashtags, but not yet!)
	* Hashtag
		* name, string

### Set up the database
	* remember ```rake db:migrate```?
	* Add users, tweets and hashtags (a couple of each) using the seeds.rb file. You can add all the different types of objects in at once, for example seeds.rb might look like:

	```
		User.Create(name: "fluffy_cat", premium_member: 0)
		Tweet.Create(text: "I'm so fluffy!")
		Hashtag.Create(name: "cats")
	```

### Create routes: After creating the model use ```resource :user``` in the routes.rb file to create routes
	* check what routes exits using the url: ```http://localhost:3000/rails/info/routes```

### Create Controller Actions
	* based on these routes, create all the necessary controller actions in each controller (leave them blank for now, you will fill them in as needed)

###Create a homepage 
	* create an "index" action on the TweetController that displays all tweets (make sure to create a corresponding "index.html.erb" view!)
	* set this to be the homepage using routes.rb
	* add two links to the view: "view all users" and "view all hashtags" 
	* create views and actions for users and hashtags to display all users and all hashtags

### Add ability to search for a tweet 
	* just like with Shirts and Movies, there should be a search bar and the list of tweets should display only matching tweets.
	* Make sure the text the user searched remains in the search box when they are viewing their results

### Add ability to create new users
	* make sure to follow good safe parameter protocols! (See safe_shirt_params function in ShirtApp as an example)
	* add a link back to the homepage from this page so the user isn't forced to use the back button on their browser
	
### Add validation to the users 
	* Make the user name not allowed to be empty 
	* Make the premium_member field only allowed to be 0 or 1
	* (Check lesson 10 notes for cheat sheet on validations)

### Display errors 
	* if user could not be created successfully (because validations were not met)

### Add ability to Edit existing user
	* Remember to use a partial view to share the form between creating and editing a user

---

If you want more practice, simply add all these features (search, create, edit, show) to all the resources in the twitter app. Try to use fewer and fewer hints each time.




