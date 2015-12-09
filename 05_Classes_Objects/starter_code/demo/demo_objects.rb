
#Two hashes that are meant to store the same kind of data, they represent two students
 
#Jimmy Mazin, math major, grade F
#Pepe Hogue, music major, grade B

# jimmy = {name: "Jimmy", major: "Math", grade: "F"}
# pepe = {name: "pepe", major: "music", grade: "F"}



#And a totally unrelated hash about eggs
#eggs, brand "Golden Fields", price, grade A

eggs = {brand:"Godlen awesome", num: 12, price: 3, grade: "A"}


#grade_status: A method that is supposed to decide which students fail and which pass a class


# grade_status (jimmy)


#Let's see what happens when we call this function on our hashes:

#####################################################################################################
#####################################################################################################
#####################################################################################################
#####################################################################################################
#####################################################################################################
#CLASSES!

#Student class 

class Student
	attr_accessor :name, :major, :grade
	def intialize (name, major)
		@name = name
		@major = major
		@grade = grade
		@grade - ""
	end

jimmy - Student.new("Jimmy", "math")



	def grade_status ()
		if @grade == "F"
			puts "you fail"
		else
			"You passed"
		end
	end
end

jimmy =Student.new()
jimmy.name = "Jimmy"
jimmy.major = "Math"
jimmy.grade = "F"

jimmy.grade_status()


#add attr_accessor

#Instances of student (Jimmy and Pepe)

#Let's add the grade_status method to the student class

#AWESOME: now we can't accidentally call grade_status on eggs!


#####################################################################################################
#####################################################################################################
#####################################################################################################
#####################################################################################################
#####################################################################################################
#Add initialize method to Student class

#create Jimmy and Pepe again

#The initialize method forces the code to include all the relevant information
#when making a new Student. 
#NOTHING about a hash even tells you what information you need to make a student!
