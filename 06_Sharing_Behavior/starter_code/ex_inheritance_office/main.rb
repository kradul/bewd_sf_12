require_relative 'employee'
require_relative 'manager'
require_relative 'marketer'

#CODE FOR TESTING: (DO NOT EDIT)
def assert_equal(expected, actual)
  unless expected == actual
    abort "Expected #{expected} to match #{actual} on line #{caller.first.split(":")[1]}"
  end
end

#Run this file to test our your code.

generic_employee = Employee.new("Some", "Person")
assert_equal(generic_employee.contact(), "Yell my name really loud: Some Person")

manager = Manager.new("John", "Snow", "Lead Developer", "john.snow@bewd.com")
assert_equal(manager.contact(), "john.snow@bewd.com")

assert_equal(manager.full_name(), "FILL THIS IN with however you chose to format the managers name and title.")

assert_equal(Employee.num_employees, 2)

marketer = Marketer.new("Snow", "White", "@lovemydwarfs")
assert_equal(marketer.contact(), "@lovemydwarfs") 

assert_equal(Employee.num_employees, 3)
