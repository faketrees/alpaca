#live share VS code for pair programming
#Rspec is a testing gem
#spec is short for specification and is used for testing
#built to code or spec....
#will eventually write 'test cases' to test our code
#the example used is add two numbers,
#basic steps, does it take in the right number of arguments, does it do the expected output
#the gemfile is a list of packages that the program needs
#run bundle install and bundle will get all the gems (packages) that you need for the code
#if you make the first line in a .rb file require "xx" that is a package ruby will need to run the code
#procs create blocks of code as an object (see stored in memory) (object_id)
# to create a proc use Proc.new {block of code goes here}
#you can also pass in a proc as a block of code after defining a method using the '&' symbol. Note syntax my_method(arg, arg) {write code here}
#if you want to pass in an already defined proc (arg, arg, &procname) note the ampersand



newline = Proc.new { |el| puts puts el * 80}



newline.call("-")
