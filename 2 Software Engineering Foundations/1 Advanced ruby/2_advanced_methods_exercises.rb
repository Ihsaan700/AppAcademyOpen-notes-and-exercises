# frozen_string_literal: true

# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num1, num2)
  (2..num2).each do |divisor|
    return false if (num2 % divisor).zero? && (num1 % divisor).zero?
  end

  true
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false


# Write a method, adult_in_group?(people), that accepts an array containing people.
# The method should return true if there is at least 1 person with an age of 18 or greater.
# The method should return false otherwise.

def adult_in_group?(people)
  people.any? { |person| return true if person[:age] >= 18 }
  false
end

people1 = [
  { name: 'Jack', age: 17 },
  { name: 'Jill', age: 21 },
  { name: 'Alice', age: 15 },
  { name: 'Bob', age: 16 }
]
p adult_in_group?(people1)    # => true

people2 = [
  { name: 'Jane', age: 12 },
  { name: 'John', age: 13 },
  { name: 'Ashley', age: 10 },
  { name: 'Bill', age: 16 }
]
p adult_in_group?(people2)    # => false

# Write a method, `only_vowels?(str)`, that accepts a string as an arg.
# The method should return true if the string contains only vowels.
# The method should return false otherwise.

def only_vowels?(str)
  vowels = 'aeiou'
  str.split('').all? { |letter| vowels.include?(letter) }
end

p only_vowels?('aaoeee')  # => true
p only_vowels?('iou')     # => true
p only_vowels?('cat')     # => false
p only_vowels?('over')    # => false


# Write a method, filter_lengths(strings, length), that accepts an array of strings
# and a length as args. The method should return an array containing the strings
# that have at least the given length. The length argument should be optional; if no length
# is passed in, then 5 should be used as the length.

def filter_lengths(strings, length=5)
  strings.select { |string| string.length >= length }
end

p filter_lengths(%w[pear dragonfruit fig clementine], 4)   # => ["pear", "dragonfruit", "clementine"]
p filter_lengths(%w[pear dragonfruit fig clementine])      # => ["dragonfruit", "clementine"]
p filter_lengths(%w[cat dog capybara mouse], 7)            # => ["capybara"]
p filter_lengths(%w[cat dog capybara mouse])               # => ["capybara", "mouse"]


# Write a method, max_inject(arr), that accepts any amount of numbers arguments and returns
# the largest number. Solve this using the built-in inject.

def max_inject(*arr)
  arr.inject { |max, el| el > max ? el : max }
end

p max_inject(1, -4, 0, 7, 5)  # => 7
p max_inject(30, 28, 18)      # => 30


# Write a method, union, that accepts any number of arrays as arguments.
# The method should return an array containing all elements of the given arrays.

def union(*arrays)
  arrays.flatten
end

p union(%w[a b], [1, 2, 3]) # => ["a", "b", 1, 2, 3]
p union(%w[x y], [true, false], [20, 21, 23]) # => ["x", "y", true, false, 20, 21, 23]


# Write a method, multi_dimensional_sum(array), that accepts a multidimensional array as an arg
# and returns the sum of all numbers in the array.

def multi_dimensional_sum(arr)
  arr.flatten.sum
end

arr1 = [
  [4, 3, 1],
  [8, 1],
  [2]
]

p multi_dimensional_sum(arr1)    # => 19

arr2 = [
  [[3, 6], [7]],
  [[5, 2], 1]
]

p multi_dimensional_sum(arr2)    # => 24
