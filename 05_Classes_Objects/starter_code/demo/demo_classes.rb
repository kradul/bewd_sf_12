#everything is an object in ruby
#objects are INSTANCES of a CLASS
#they have METHODS

1.class
# => Fixnum

1.to_s
# => "1"

a = ["a"]
#=> ["a"]
a.class()
#=> Array

#even classes are objects!
#Array is a class, and it has a method called "new"
b = Array.new()
#=> []

Array.class
#=> Class

#let's make our own class
class Cat
end

c = Cat.new()
#=> #<Cat:0x007f96d9142608>

c.class
# => Cat


[1] pry(main)> 1.class
=> Fixnum
[2] pry(main)> 1.to_s
=> "1"
[3] pry(main)> array = ["a"]
=> ["a"]
[4] pry(main)> array.class
=> Array
[5] pry(main)> class Cat end
[5] pry(main)* end
SyntaxError: unexpected keyword_end, expecting '<' or ';' or '\n'
[5] pry(main)> class Cat
[5] pry(main)* end  
=> nil
[6] pry(main)> c = Cat.net()
NoMethodError: undefined method `net' for Cat:Class
from (pry):7:in `__pry__'
[7] pry(main)> c = Cat.new
=> #<Cat:0x007f94b9173978>
[8] pry(main)> c.class
=> Cat
[9] pry(main)> 