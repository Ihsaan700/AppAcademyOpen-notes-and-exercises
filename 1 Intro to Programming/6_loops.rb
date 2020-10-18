# frozen_string_literal: true

def repeat(str)
  i = 0
  while i <= str.length
    puts str
    i += 1
  end
end

def repeat2(str)
  i = 0
  while i <= str.length
    puts str[i]
    i += 1
  end
end

# puts repeat2("experience")

def print_nums(min, max, step)
  i = min
  while i <= max
    puts i
    i += step
  end
end

# print_nums(10, 20, 2)

def print_nums2(min, max, step)
  i = min
  while i <= max
    puts i
    break if i == 16

    i += step
  end
end

# print_nums2(10, 20, 2)


# def printNums3(min, max, step)
#   i = min
#   while i <= max
#     puts i
#     if i == 14
#       next
#     end
#     i += step
#   end
# end

# printNums3(10, 20, 2)


# Write a method count_e(word) that takes in a string word and returns the number of e's in the word

def count_e(word)
  e = 0
  i = 0
  while i < word.length
    e += 1 if word[i] == 'e'
    i += 1
  end

  e
end

# puts count_e("movie") # => 1
# puts count_e("excellent") # => 3


# Write a method count_a(word) that takes in a string word and returns the number of a's in the word. The method should count both lowercase (a) and uppercase (A)

def count_a(word)
  a = 0
  i = 0
  while i < word.length
    if word[i] == 'a' || word[i] == 'A'
      a += 1
    end
    i += 1
  end

  return a
end

# puts count_a("application")  # => 2
# puts count_a("bike")         # => 0
# puts count_a("Arthur")       # => 1
# puts count_a("Aardvark")     # => 3


# Write a method, count_vowels(word), that takes in a string word and returns the number of vowels in the word. Vowels are the letters a, e, i, o, u.

def count_vowels(word)
  vowels = 0
  i = 0

  while i < word.length
    if word[i] == "a" || word[i] == "e" || word[i] == "i" || word[i] == "o" || word[i] == "u"
      vowels += 1
    end
    i += 1
  end
  return vowels
end

# puts count_vowels("bootcamp")  # => 3
# puts count_vowels("apple")     # => 2
# puts count_vowels("pizza")     # => 2


# Write a method sum_nums(max) that takes in a number max and returns the sum of all numbers from 1 up to and including max.

def sum_nums(max)
  sum = 0
  i = 1
  while i <= max
    sum += i
    i += 1
  end
  return sum
end

puts sum_nums(4) # => 10, because 1 + 2 + 3 + 4 = 10
puts sum_nums(5) # => 15


# Write a method factorial(num) that takes in a number num and returns the product of all numbers from 1 up to and including num.

def factorial(num)
  sum = 1
  i = 1

  while i <= num
    sum *= i
    i += 1
  end

  return sum
end

# puts factorial(3) # => 6, because 1 * 2 * 3 = 6
# puts factorial(5) # => 120, because 1 * 2 * 3 * 4 * 5 = 120


# Write a method reverse(word) that takes in a string word and returns the word with its letters in reverse order.

def reverse(word)
  i = word.length

  while i >= 0
    puts word[i]
    i -= 1
  end
end

# puts reverse("cat")          # => "tac"
# puts reverse("programming")  # => "gnimmargorp"
# puts reverse("bootcamp")     # => "pmactoob"


# Write a method is_palindrome(word) that takes in a string word and returns the
# true if the word is a palindrome, false otherwise. A palindrome is a word that
# is spelled the same forwards and backwards.


def is_palindrome(word)
  palindrome = ''

  i = 0

  while i < word.length
    palindrome = word[i] + palindrome
    i += 1
  end

  if word == palindrome
    return true
  else
    return false
  end
end

puts is_palindrome('racecar')  # => true
puts is_palindrome('kayak')    # => true
puts is_palindrome('bootcamp') # => false
