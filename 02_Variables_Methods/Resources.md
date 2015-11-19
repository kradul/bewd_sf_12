![BEWD_Logo](../assets/BEWD_Logo.png)

#Resources - Variables and Conditional Logic

###Cheat Sheet

__Variables__


```ruby
 real_name = "Bruce Wayne"
 secret_identity = "Batman"
```

*String interpolation aka Adding Variables to String*

```ruby
puts "We just spilled the beans #{real_name} is #{secret_identity}"
```

> We just spilled the beans Bruce Wayne is Batman

__Arithmetic Operators__

| Operator | Description | Example (a = 4 and b = 2) | Output |
| ------------- |:-------------| :-----|:-----|
| ```+```      | Addition (add left to right, give result) |  ```puts a + b```  | 6 |
| ```-```      |  Subtraction (subtract left from right, give result)    |  ```puts a - b```  | 2 |
| ```*``` | Multiplication (multiply left by right, give result)   | ```puts a * b```  | 8 |
| ```/``` | Division (divide left by right, give result)  | ```puts a / b``` | 2 |
| ```%``` | Modulus (divide left by right, give remainder) | ```puts a % b```  | 0 |
| ```**``` |Exponent (multiply left by left, right times, give result)  | ```puts a ** b``` | 16 |


__Conditionals Operators__

| Operator        | Description  | Example         (a = 4 and b = 2)  | Evaluated As |
| -------------   |:-------------| :-----|:-----|
| == | Equality |  a == b | false |
| != |  Not Equal | a != b | true  |
| >  | Greater than | a > b | true  |
| < | Less than |a < b | true  |
| >= |Greater than  or equal to | a >= b | false |
| <= |Less than or equal to | a <= b | false |
| <=> |Same value? return 0, less than? return -1, greater than? return 1 | a <=> b | 1 |
| .eql? | same value and same type?| 1.eql?(1.0)| false |


__If Syntax__

```ruby
if (condition)
  code to execute if the condition is true
end
```

```ruby
if var == 20
   puts "Variable is 20"
end
```

__If Else Syntax__

```ruby
if var == 20
   puts "Variable is 20"
else
   puts "Variable is another number"
end
```

__If Else If Syntax__

```ruby
if var == 20
   print "Variable is 20"
elsif var == 30
   print "Variable is 30"
else
   print "Variable is something else"
end
```

__Methods__

__Simple Methods__

```ruby
def method_name
end
```

__Method w/ Parameters__

```ruby
def say (something)
      puts "They said " + something.to_s
end

 say ("Hello")

=> They said Hello
```

Note: This can also be written as ```"They said #{something}"```. This is called "string interpolation". It's the Ruby Way. Look it up on a search engine for more information!


__Running .rb from the terminal__

```
	ruby file_name.rb
```

###Tips, Tricks and Motivation

- What is Programming [video](http://www.youtube.com/watch?v=YCDTYlUWkQE)
- Using Sublime Text 2 [video tutorial](https://tutsplus.com/course/improve-workflow-in-sublime-text-2/)
- [Tricked Out Sublime Text](http://net.tutsplus.com/tutorials/tools-and-tips/sublime-text-2-tips-and-tricks/)
-	[Learning to Program](http://worrydream.com/LearnableProgramming/)


###Still Feel Lost? 
####Catch Up With These Resources

- Intro to Ruby [tutorial](http://www.codeschool.com/courses/try-ruby) from Code School for beginners to wrap your head around programming concepts.
- Beginner Ruby [Tutorial](- http://www.codecademy.com/courses/ruby-beginner-en-d1Ylq?curriculum_id=5059f8619189a5000201fbcb)
- Book [chapter](http://ruby.bastardsbook.com/chapters/ifelse/) on conditionals.
- [Article](http://ruby.about.com/od/control/a/Conditional-Statements.htm) from about.com about ruby conditional statements.
- [Article](http://strugglingwithruby.blogspot.com/2008/11/conditional-statements.html) - More about true and false.
- [Khan academy tutorial](https://www.khanacademy.org/math/geometry/logical-reasoning/e/conditional_statements_and_truth_value) about logical reasoning.
- More on Methods [Videos](https://vimeo.com/gatv/review/67752033/50fc5adfa7) by Steven Nuñez for GA.
	-	password => BEWD_GA 
