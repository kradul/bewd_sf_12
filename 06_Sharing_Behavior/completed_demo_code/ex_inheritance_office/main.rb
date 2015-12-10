require_relative 'lib/employee'
require_relative 'lib/manager'
require_relative 'lib/marketer'

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

assert_equal(manager.full_name(), "John Snow (Lead Developer)")

assert_equal(Employee.get_num_employees(), 2)

marketer = Marketer.new("Snow", "White", "@lovemydwarfs")
assert_equal(marketer.contact(), "@lovemydwarfs") 

assert_equal(Employee.get_num_employees(), 3)
