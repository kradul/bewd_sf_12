require 'twilio-ruby' 
require 'pry'

class ContactController < ApplicationController
	def index
		@contacts = Contact.all
	end

	def send_text
		account_sid = ENV['TW_SID']
		auth_token = ENV['TW_TOKEN']
		number = ENV['TW_NUMBER']

		@contact = Contact.find(params[:id])

		# set up a client to talk to the Twilio REST API 
		@client = Twilio::REST::Client.new account_sid, auth_token 
		 
		@client.account.messages.create({
			:from => number, 
			:to => @contact.phone, 
			:body => params[:body] 
		})

		redirect_to root_path
	end
end
