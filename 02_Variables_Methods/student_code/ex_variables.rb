# Variables Exercise
# (Also exercise in using pry!)

#Create a variable named 'a' and assign it's value to 5.

#Create a variable named 'b' and assign it's value to 'a'.

#use a debugging statement (break point) in pry to check the value of the variables 'a' and 'b'
#HINT: are you forgetting to add a line at the top of the file? :)


#Run the file. (Remember how to do this on the command line? '$ ruby ex_variables.rb'
	# Are you in the right folder?)


#Increment (aka increase) the value of 'a' by 1.

=begin
Check it out, this is a multiline comment! This is great when you need to write a lot 
to explain your code!

Sidenote about incrementing. You probably wrote 'a = a + 1', that totally works and is great.
But this is such a common thing to write in programming (as you'll see later) that there's a shortcut.
Try 'a += 1', it does the same thing! (This is less common, but you can also do this with any number 
ex. 'a += 5' or other arithmetic ex. 'a -= 1' or 'a *= 2')
=end


#Add a breakpoint, check the value of both 'a' and 'b'. Are they still the same?

=begin
You probably noticed that 'a' and 'b' no longer have the same value even though you defined
'b' to be the value of 'a'. What's going on?

When you assigned the value of 'b', ruby EVALUATED (calculated the value of) 'a'
and set 'b' to that (in this case the value was the number 5). Then ruby completely forgets
that 'b' was set to 'a', now 'b' is set only to 5, that's it.

This is the same thing that happens if you set 'b' to be 2*4. The value of 'b' will just be 8,
there will be no way to tell that the number 8 came from 2*4 not 2+6 or 11-3.
=end



