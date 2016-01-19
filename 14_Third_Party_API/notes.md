



Useful debugging techniques:
* google the error message, sometimes third parties aren't very forthcoming with good error handling
* pry!
* if you have a gem like twilio-ruby, try ```.methods``` method on the object to discover what properties it has ex. ```@client.methods``` (hit "q" to exit and go back to pry)

---
##API
* Interact with other websites! 
* Use their data, ex get real stories from Reddit
* Edit/publish to their user's accounts (with permission), ex. post to facebook
* two types of APIs: protected and public

---
###Protected APIs - OAuth

*	Require an API key
*	Give your app access to resources
*	Give your users permission to delegate rights to your application
*	Identify you as a user in the system
*	Grant you rights based on that key

---

###Public APIs - Mashable, Reddit Digg

*	Don't require a key
*	May have limits on number of requests
*	Limit on what you can do, mostly just reading data.

---

##API
###Documentation

*	Reading API documentation is a skill, it takes practice. Don't feel overwhelmed if everything doesn't click right away. This really takes a lot of patience, every API has it's quirks and ins and outs.

*	How to read API documentation articles are available in the resources section.

---
#Demo: Twilio App

####App Description

A phone book application that can send sms messages from your Rails app.


*	Go to [Twilio](https://www.twilio.com/user/account) and create a free trial account.
	*	Trial accounts allow a few free texts.
	*	Sending text messages costs a penny per text message and the minimum account is $20 and includes a phone number.

####Setting up Twilio Gem:
* gem install twilio-ruby
* add it to gem file
* run bundle install
* use rails console to try loading the gem (require 'twilio-ruby') and see if you get an error (should return "false" if all is ok)
* remember to restart rails server after adding a gem


*  ENV[‘TW_SID’], ENV[‘TW_TOKEN’] and ENV['TW_SOURCE_NUMBER'].



####Setting up your App
*	Create the user model with name, phone

*	Add some data to the seeds.rb file.

		User.delete_all #delete all users and start fresh, lets you run seeds.rb multiple times without creating duplicate data

		User.create(:name => 'Bob', :phone => '+12125551212')
		User.create(:name => 'Sam', :phone => '+12125551213')
		User.create(:name => 'Joe', :phone => '+12125551214')

*	Add a page that lists all users and set this page to be your homepage.
*	Create the send method in the users controller.
* 	Add it to routes so it includes the user_id in the URL: ex "users/:user_id/send_text" See the hints in the routes file comments.

*	Add a text input box for each user that will send a message to the user on submit. 

```
<%= form_tag "/users/#{user.id}/send_text" do %>
	<%= text_area_tag :body %>
	<%= submit_tag "Send message" %>
<% end %>
```

*	Go to Twilio > Dashboard. At the top, there are two numbers there that you want to keep to yourself, the Account SID and the Auth Token. Add token and SID to your ```~/.bashrc``` file:
NOTE: You have two accounts, Test and Trial. The Test account will not actually send a text, just a 200 OK status code as the response. If you want to actually receive a text on your phone, use the Trial account.

```
	export TW_SID="<Twilio Account SID>"
	export TW_TOKEN="<Twilio Auth Token>"
	export TW_SOURCE_NUMBER="<Twilio Number>" (e.g. export TW_SOURCE_NUMBER="+16503535688") #formatting is important!
```

*	Reload your terminal environment (using ```source ~/.bashrc```) and test in your terminal:

```
		echo $TW_SID
		echo $TW_TOKEN
		echo $TW_SOURCE_NUMBER
```

* Get SID and Token from environment:
	```
	account_sid = ENV["TW_SID"]
    auth_token = ENV["TW_TOKEN"]
	```

* Client from twilio: ```@client = Twilio::REST::Client.new account_sid, auth_token``` (See documentation on how to send mesassges)

* Use user_id parameter to find the user's phone number

* Read Twilio documentation on how to send a text message:

```
@client.account.messages.create({
      from: "+16178700361",
      to: @user.phone,
      body: params[:body]
      })
```

*	Go into your seeds.rb and add a user with a real phone number. Try it out!






