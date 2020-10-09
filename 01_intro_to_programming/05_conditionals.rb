# frozen_string_literal: true

# conditions allow us to run code under different circumstances

# num = 42

# if num > 0
#   puts "positive"
# end

# num2 = 0

# if num2 > 0
#   puts "positive"
# elsif num2 < 0
#   puts "negative"
# else
#   puts "its zero"
# end

# way 1
# def either_only(num)
#   if (num % 3 == 0 || num % 5 == 0) && !(num % 3 == 0 && num % 5 == 0)
#     return true
#   else
#     return false
#   end
# end

# way 2
def either_only(num)
  if (num % 3 == 0 && num % 5 != 0) || (num % 3 != 0 && num % 5 == 0)
    true
  else
    false
  end
end

puts either_only(9)
puts either_only(20)
puts either_only(7)
puts either_only(15)
puts either_only(30)

def larger_number(num1, num2)
  if num1 > num2
    num1
  else
    num2
  end
end

puts larger_number(42, 28)
puts larger_number(99, 100)

# Write a method longer_string(str1, str2) that takes in two strings and returns
# the longer of the two strings. In the case of a tie, the method should return
# the first string.

def longer_string(str1, str2)
  if str1.length > str2.length || str1.length == str2.length
    str1
  else
    str2
  end
end

puts longer_string('app', 'academy') # => "academy"
puts longer_string('summer', 'fall') # => "summer"
puts longer_string('hello', 'world') # => "hello"

# Write a method number_check(num) that takes in a number and returns a string. The method should return the string 'positive' if the num is positive, 'negative' if the num is negative, and 'zero' if the num is zero.

def number_check(num)
  if num > 0
    'positive'
  elsif num < 0
    'negative'
  else
    'zero'
  end
end

puts number_check(5)    # => "positive"
puts number_check(-2)   # => "negative"
puts number_check(0)    # => "zero"

# Write a method word_check(word) that takes in a word and returns a string. The method should return the string "long" if the word is longer than 6 characters, "short" if it is less than 6 characters, and "medium" if it is exactly 6 characters long.

def word_check(word)
  if word.length > 6
    'long'
  elsif word.length < 6
    'short'
  elsif word.length == 6
    'medium'
  end
end

puts word_check('contraption') # => "long"
puts word_check('fruit')       # => "short"
puts word_check('puzzle')      # => "medium"
