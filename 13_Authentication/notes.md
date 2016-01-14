

https://github.com/plataformatec/devise#getting-started

#Notes

#BEWD - Authentication

---

##Agenda

*	Authentication
	*	Authentication Explained
	*	Devise Gem
*	Lab
	*	Authenticated Ritly

---


##Authentication

*	Use of a combination of username and password to validate user identity. (Obvious I know…)
*	Tracking a user's identity on our app through the __session__.
*	When the user is authenticated we store the user_id in the __session__.

---

##Managing Users
###Session

*	Session data commonly includes the browser user’s identity (name, login, shopping cart, etc.).

*	To work, the web server must uniquely identify each browser’s particular HTTP requests while the session lasts.

*	Commonly, web servers identify browsers by asking them to store a __cookie__.

---

##Managing Users
###Cookie

*	Used to store small bits of information (maximum size about 4k).
*	Cookies allow web servers to provide a temporary unique ID to a browser, to enable session management.
	*	Browser storage is not secure.
	*	Sensitive data (credit card numbers, etc.) should never be set in a cookie

---

##Authentication
###Gems
Creating authentication from scratch is a complex process (see resources for more info). However Developers have created Gems to make authentication "easy".

*	__Devise__
*	CanCan
*	Clearance
*	OmniAuth
*	DoorKeeper

---

##Authentication
###Devise GEM

*	Straight-forward to implement, integrate and customize.
*	Handles complex security, so you don't have to.
*	Provides controller filters and view helpers (more on that in the code along).

---
###Setting up Devise

* Open the Gemfile and add ```gem 'devise', '3.4.1'```
* ```$ bundle install``` - install the new gem
* ```$ rails generate devise:install``` - set up devise for this app, generates files for devise, ex config files 
* ```$ rails generate devise User``` - generate a model called User that will be authenticated with devise 
	*(can call it Admin or whatever else you'd like, note many futher methods that include the word "user" will instead include "admin" etc.)
* remember to restart the server! (You don't need to restart it for file changes, but for new gem installs to take effect you do.)

* Note: config/initializers/devise.rb is devise's configuration file, there are many options you can configure

---

###Devise User Model

The model will be empty except the following devise configurations:

```
devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable
```

A brief explanation of each:
*	database_authenticatable – Users will be able to authenticate with a login and password that are stored in the database.
*	registerable – Users will be able to register, update, and destroy their profiles.
*	recoverable – Provides mechanism to reset forgotten passwords.
*	rememberable – Enables “remember me” functionality that involves cookies.
*	trackable – Tracks sign in count, timestamps, and IP address.
*	validatable – Validates e-mail and password (custom validators can be used).

There are many other options, look in devise docs! If you want to add or remove these modules edit the Model and also edit the corresponding migration file (...devise_create_users.rb)

---
Add any other properties (ex. name) to User model.

---
###Devise routes

When you create a devise user, devise automatically adds to the routes file ```devise_for :users``` and creates a bunch of routes. Check them out at ```http://localhost:3000/rails/info/routes```

These allow you to navigate the devise views.

---

###Load Devise Views

```$ rails generate devise:views``` generates devise views explicitly so you can customize them.

Brief explanation of views:

	* confirmations – This has a lone new.html.erb view that is being rendered when a user requests to resend the confirmation e-mail.
	mailer – All the templates for emails are stored here.
	* passwords – Views with forms to request password, reset email, and actually change the password.
	* registrations – The new.html.erb view is rendered when a user registers on the site. edit.html.erb contains a form to update profile.
	* sessions – There is only one view, which is the login form for the site.
	* shared – Only one partial is present here, which contains links that are being displayed on each Devise’ page (like “Forgot your password?”, “Re-send confirmation email”, etc.)
	* unlocks – Only one view with a form to request an email with an unlock link.

----
Strong parameters

Can use strong parameters with devise controller. If using that need to whitelist any additional user parameters, ex. name:

In application_controller.rb:

```
  before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) << :name
	  devise_parameter_sanitizer.for(:account_update) << :name
	end
```

---
###Creating the nav bar

If no user:
	* Log In: user_session_path (devise/sessions#create)
	* Sign Up: new_user_registration_path (devise/registrations#new)

If user signed in:
	* Profile: edit_user_registration_path (devise/registrations#edit)
	* Log Out: destroy_user_session_path (devise/sessions#destroy)


Use ```user_signed_in?``` in your HTML to display different content to users who are signed in vs those who are not.

Another useful method ```current_user```, returns either a user record or nil. For instance if you want to display current user's username etc.

(NOTE if you called your model "admin" these would be: ```admin_signed_in?``` and ```current_admin```).

---
Logging out:

```
<%= link_to 'Log out', destroy_user_session_path %>
```

Go to config/initializers/devise.rb, find ```config.sign_out_via``` and set it to ```:get```. (This isn't necesarily the recommended way of doing this, usually you want to use DELETE, and add ":method => :delete" to the HTML, but this requires setting up some Javascript and is out of the scope of this lesson.)

NOTE: Restart your Rails server!!

---
###Authenticating certain pages

For instance if you want only the controller action "secret" to be inaccessible to logged out users here's example code:

```
before_action :authenicate_user!, only: [:secret]
```

"Only" provides a list of actions to execute the before action for. The default is to execute the before action for ALL actions on that controller.

---
###Only Logged In Users can Comment

Add an if statement around the form for adding comments. Can also use a before_action to check that the user is signed in on the controller to prevent malicious requests.

---
###Adding Associations to Devise User

This would work just like adding associations to a non-devise user (as covered previously). The only extra bit of info is that you can use ```current_user``` to set the user for newly created comments automatically.

Here's how:
In the comments controller:

```
def create
    if user_signed_in?
      safe_comment = params.require(:comment).permit(:post).merge(story_id: params[:story_id])
      @comment = current_user.comments.create safe_comment
      redirect_to @comment.story
    else
      redirect_to new_user_session_path, alert: "Only logged in users can create comments"
    end
end
```

Note how we create the new comment as part of the current user's list of comments! ```current_user.comments.create(safe_comment)```

Why don't we have to save? Because the create method creates and saves.

---
###(OPTIONAL INFO) Sidenote on Alerts:

Here the ```redirect_to``` function takes the "alert" option and adds a key:value pair "alert: 'Only logged in users can create comments'" to the flash hash. 

```flash``` is basically a lightweight hash that passes small primitives (strings, integers, arrays etc) between actions.

To get the messages to show up in your application add this html to your application.html.erb layout:

```
    <% flash.each do |key, value| %>
	    <div class="alert alert-<%= key %>">
	      <%= value %>
	    </div>
	<% end %>
```

This simply iterates through each key, value pair in flash and creates a div for it to be displayed in.

Read more about flash [here](http://api.rubyonrails.org/classes/ActionDispatch/Flash.html).

---
## Exercise
Movie App with authenticated Users.

---
## Homework: Finish Authenticated MovieApp
Use devise to add users to the Movie App.
Add the associations between users and movies (ex. a User has a list of Movies that they have watched. Does a Movie need a list of Users that have watched it?)


## Resources

###Cheat Sheet

Adding an association to an existing model, in the migration file:

```
add_reference :movies, :genre, index: true
```

Extra info:
*	Changing the default Route names

		devise_for :users, :path_names => { sign_in: 'login', sign_out: 'logout' }

###Tips, Tricks & Advanced Reading

*	If you want to expand your knowledge about Rails authentication gems visit [Ruby Toolbox](https://www.ruby-toolbox.com/categories/rails_authentication) for a few more authentication gem options.

*	Great [article](http://scientopia.org/blogs/goodmath/2013/03/02/passwords-hashing-and-salt/) explaining passwords, hashing, and salt.


*	Advanced [article](http://edapx.com/2012/04/18/authorization-and-user-management-in-rails/) about authorization and users management in rails.

*	[Tutorial](http://everydayrails.com/2012/07/31/rails-admin-panel-from-scratch.html) on how to create an advanced admin panel.

*	[Authentication From Scratch](http://railscasts.com/episodes/250-authentication-from-scratch) Rails Cast



###Still Feel Lost?
####Catch Up With These Resources

*	[Devise](http://railscasts.com/episodes/209-introducing-devise) Rails Cast

