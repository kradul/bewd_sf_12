
require 'pry'

class AddressBook

 	def initialize ()
 		@contacts = []
	end

	#create a contact using the hash syntax
	def create_contact(name, telephone, email)
	  contact = {name: name, telephone: telephone, email: email}
	end


	def contact_log()
	  @contacts.each do |contact|
	    puts "Name: #{contact[:name]}. Tele: #{contact[:telephone]}. Email: #{contact[:email]}"
	  end
	end

	#find a specific contact and print the telephone number
	def find_and_call_contact(name)
	  @contacts.each do |c|
	    if c[:name] == name
	      puts "I found #{contact[:name].capitalize} in your contacts database\n"
	      puts "I am dialing the number now. It is #{contact[:telephone]}"
	    end
	  end
	end

	def add_to_contacts(contact)
	  @contacts << contact
	  puts "#{contact[:name].capitalize} has been added!!"
	end

	def create_and_add(name, telephone, email)
	end

end

