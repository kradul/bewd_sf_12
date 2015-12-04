

invisible_var = 2

#an example of an incorrect scope!
def put_var_error
end

puts "Try to use the put_var_error method:"
put_var_error()

#an example of correct scope with an argument
def put_var_arg
end

puts "Try to use the put_var_arg method:"
put_var_arg(invisible_var)

#an example of correct scope, defining a variable inside a function
def put_var_scope
end

#an example of scope in a loop
def scope_loop
end	