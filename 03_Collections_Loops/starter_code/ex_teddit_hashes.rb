# Step 1: Working with Arrays and Hashes

# Create an empty stories array. This will be used to hold all stories we capture.
# Users enter the story as they do now, but it gets put in a hash instead. 
# Update any reference to the story (upvotes, category and title) 
# Your story hash should look like the one below: 
# { title: "Monkeys thank mayor for flounder tooth necklace", category: "Teeth", upvotes: 1 }
# Add the hash to an array called stories and print "Story: Monkeys thank mayor for flounder tooth necklace, Category: (Teeth), Current Upvotes: 1"
# Using the stories array 
# Test your cat, bacon, and food upvote conditional logic.

# If the Story has the word 'cat' multiply the upvotes by 5
    # If the Story has the word 'bacon' multiply the upvotes by 8
    # NOTE: look at the ruby docs to see how to check if a string has another string in it!
    # (google something like "ruby string contains substring")
    # NOTE: capitalization isn't important so consider using the "downcase" method (google it!)
    # If the Story's category is 'food' it gets 3 times the upvotes.

#
# Step 2: Adding Loops 
# Use a loop, so that your program continues to ask a user for stories until they chose to quit. ("Would you like to add another story? Enter 'y' or 'n'")
# Once the user is finished with entering their stories, use .each to print each story in the stories array. 
#

def get_input
  gets.strip
end

def calculate_upvotes(story)
  upvotes = 1
  title = story[:title]
  category = story[:category]
  # Could I also put here story = [title:title, category:category]? 
  if title.downcase.include? 'cat'
    upvotes *= 5
  end
  if title.downcase.include? 'bacon'
    upvotes *= 8
  end
  if category.downcase == "food"
    upvotes *= 3
  end

  upvotes
end

def collectstory
  puts "Welcome to Teddit! a text based news aggregator. Get today's news tomorrow!"
  story = {}
  puts "Please enter a News story:"
  title = get_input
  story[:title] = title
  # could I also do story = [title: title]?
  # could also do: 
  # story[:title] = get_input
  puts "Please give it a category:"
  story[:category] = get_input
  story[:upvotes] = calculate_upvotes(story)
  story
end

stories = []

answer = "y" 

while answer == "y" do
  stories << collectstory()
  puts "Would you like to add another story? Enter 'y' or 'n'"
  answer = get_input.downcase.to_s
end

stories.each do |story|
  puts "New story added! #{story[:title]}, Category: #{story[:category].capitalize}, Current Upvotes: #{story[:upvotes]}"
end 













