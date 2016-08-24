#1 - Create a contact_list using hashes
    #Each entry should have a name, telephone, email
#2 - Create a method that tells you how many contacts are in your contact list
#3 - Create a method that iterates through each contact. It should print the name, telephone and email details
#4 - Create a method that selects a specific name (or key) and "dials" (prints) the phone_number

##NOTES -- THERE ARE MANY WAYS TO DO THE ABOVE. Feel free to use your own strategy #####
# require 'pry'

# def contacts_count(contacts)
# end


array =[]

def create_contact 

	single_contact = {}

	puts "please enter your name"
	single_contact[:name] = gets.chomp.to_s	

	puts "please enter telephone #"
	single_contact[:telephone] = gets.chomp.to_s

	puts "please enter your email"
	single_contact[:email] = gets.chomp.to_s

	single_contact []

	single_contact

end

def add_to_contacts(contact_array, single_contact)
 contact_array << single_contact
end


3.times do
	add_to_contacts(array, create_contact)
end

puts array[1]



# 1.upto(3) do |i|
# 	create_contact (array)
# end

# puts array[1]





# #iterate through all contacts. Print THE name, email & telephone using iterpolation "#{this_syntax_is} interpolation" 
# def contact_log(contacts)
# end

# #find a specific contact and print the telephone number
# def find_and_call_contact(contacts, name)
# end



# #array to hold each contact
# contacts = []

# # #Examples. Only directional you can do this whatever way you like
# # contact = create_contact("kisha", "555-555-5555", "kisha@example.com")
# # add_to_contacts(contacts, contact)
# #
# # contact = create_contact("david", "222-222-2222", "david@example.com")
# # add_to_contacts(contacts, contact)
# #
# # contact = create_contact("nicole", "444-444-4444", "nicole@example.com")
# # add_to_contacts(contacts, contact)
# #
# # ####
# # contacts_count(contacts)
# #
# # #find_a_name
# # name = "kisha"
# # find_and_call_contact(contacts, name)
# #
# # #contact_logs
# # contact_log(contacts)