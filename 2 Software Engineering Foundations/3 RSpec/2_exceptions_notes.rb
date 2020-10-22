# frozen_string_literal: true

# Here are two examples of classic exceptions or errors that will halt our execution:

def my_method(arg1, arg2)
  puts arg1
  puts arg2
end

my_method('a') # ArgumentError: wrong number of arguments (given 1, expected 2)

5 + nil # TypeError: nil can't be coerced into Integer


# ==============================================================================
# Handling Exceptions
# ==============================================================================

num = 0

(10 / num) # ZeroDivisionError: divided by 0

puts 'finished'

# Reaching the ZeroDivisionError exception would halt execution of the program and we would never get to reach the final puts "finished". This could be deadly if there is some critical code after the exception that we still want to execute, regardless of the fact we got an exception.

num = 0

begin
  puts "dividing 10 by #{num}"
  ans = 10 / num
  puts "the answer is #{ans}"
rescue StandardError
  puts 'There was an error with that division.'
end

# The behavior of begin...rescue is this: The code in the begin block will execute until an exception is reached. Once an exception is reached, the execution will immediately jump to rescue. This behavior is evident by the fact that the code above doesn't print "the answer is ", because the exception is reached on the line before.


# ==============================================================================
# Raising Exceptions
# ==============================================================================

# implementing our own exceptions

def format_name(first, last)
  raise 'arguments must be strings' unless first.instance_of?(String) && last.instance_of?(String)

  first.capitalize + ' ' + last.capitalize
end

# In the code above we see raise, this is how we can make exceptions manually. You'll commonly hear the phrase "raise an error" or "raise an exception" to refer to this.

# Bringing it all together
# Since our format_name method can raise an exception, we can also handle it with begin...rescue.

def format_name(first, last)
  raise 'arguments must be strings' unless first.instance_of?(String) && last.instance_of?(String)

  first.capitalize + ' ' + last.capitalize
end

first_name = 42
last_name = true
begin
  puts format_name(first_name, last_name)
rescue StandardError
  # do stuff to rescue the "arguments must be strings" exception...
  puts 'there was an exception :('
end

# An important distinction to note is that raise is how we bring up an exception, whereas begin...rescue is how we react to that exception.
