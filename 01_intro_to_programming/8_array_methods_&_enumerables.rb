# frozen_string_literal: true

# add to END of array
arr = ['hello']
print arr.push('world', 'universe')

# remove from END of array
arr2 = ['bye', 'world']
arr2.pop
print arr2

# add from FRONT of array
arr3 = ['chips', 'burgers', 'wings']
puts arr3.unshift('drink')

# remove from FRONT of array
arr4 = ['blue', 'red', 'green']
puts arr4.shift

################################

arr5 = %w[laptop computer mouse]
puts arr5.index('computer')
puts arr5.include?('mouse')

################################

arr5 = %w[laptop computer mouse]
arr5.reverse!
print arr5

################################

arr6 = %w[a b c d e]
print arr6[1...3]

################################

str = 'hey how are you'
print str.split
print str.split('how') # isolate this word and print everything else
print str.split('') # make every character an array
puts str.split('h').join('x')

arr7 = %w[what are you doing]
puts arr7.join('_')

################################

months = ['jan', 'feb', 'march', 'april']

# single line block
months.each { |month| puts month }
months.each_with_index { |x, index| puts index }

# multi-line block
months.each do |month|
  puts month
end

sentence = 'what is up'
sentence.each_char {|x| puts x}
sentence.each_char.with_index {|x, y| print y}


################################


# iterating through a range of numbers

(1..10).each { |num| puts num }

def fizzbuzz(max)
  fizz = []

  (1...max).each do |num|
    if num % 3 == 0 && num % 5 != 0
      fizz << num
    end

    if num % 5 == 0 && num % 3 != 0
      fizz << num
    end
  end
  fizz
end

puts fizzbuzz(20)

################################


# Nested Loops

(1..3).each do |n1|
  puts n1
  (1..5).each do |n2|
    puts ' . ' + n2.to_s
  end
end


(1..3).each do |n1|
  (1..5).each do |n2|
    puts n1.to_s + ' ' + n2.to_s
  end
end


arr8 = %w[a b c d]

# arr8.each do |ele1|
#   arr8.each do |ele2|
#     puts ele1 + ele2
#   end
# end

# avoid duplicate pairs, iterate through unique pairs

arr8.each_with_index do |ele1, idx1|
  arr8.each_with_index do |ele2, idx2|
    if idx2 > idx1
      puts ele1 + ele2
      puts idx1.to_s + " " + idx2.to_s
      puts "-----"
    end
  end
end


# two dimensional arrays

arr9 = [
  %w[a b c],
  %w[d e],
  %w[f g h i]
]

arr9.each do |subArr|
  print subArr
  puts
  subArr.each do |ele|
    puts ele
  end
end


# Write a method to_initials that takes in a person's name string and returns a string representing their initials.

def to_initials(name)
  split = name.split(' ')
  initials = ''
  split.each do |ele| initials  << ele[0]
  end

  return initials
end

puts to_initials('Kelvin Bridges')      # => "KB"
puts to_initials('Michaela Yamamoto')   # => "MY"
puts to_initials('Mary La Grange')      # => "MLG"


# Write a method first_in_array that takes in an array and two elements, the method should return the element that appears earlier in the array.

def first_in_array(arr, el1, el2)
  if arr.index(el1) < arr.index(el2)
    el1
  else
    el2
  end
end

puts first_in_array(%w[a b c d], 'd', 'b'); # => "b"
puts first_in_array(%w[cat bird dog mouse], 'dog', 'mouse'); # => "dog"


# Write a method abbreviate_sentence that takes in a sentence string and returns a new sentence where every word longer than 4 characters has all of it's vowels removed.

def abbreviate_sentence(sent)
  words = sent.split(' ')

  new_words = []

  words.each do |word|
    if word.length > 4
      new_word = abb_word(word)
      new_words << new_word
    else
      new_words << word
    end
  end

  return new_words.join(' ')

end

def abb_word(word)
  vowels = 'aeiou'
  new_word = ''

  word.each_char do |char|
    if !vowels.include?(char)
      new_word += char
    end
  end

  new_word

end


puts abbreviate_sentence('follow the yellow brick road') # => "fllw the yllw brck road"
puts abbreviate_sentence('what a wonderful life')        # => "what a wndrfl life"


#Write a method format_name that takes in a name string and returns the name properly capitalized.

#  Hint: use str.upcase and str.downcase
# "abc".upcase # => "ABC"

def format_name(str)
  fname = []

  split = str.split(' ')

  split.each do |item|
    fname << item[0].upcase + item[1..].downcase
  end
  fname.join(' ')
end

puts format_name("chase WILSON") # => "Chase Wilson"
puts format_name("brian CrAwFoRd scoTT") # => "Brian Crawford Scott"



# Is Valid Name Write a method is_valid_name that takes in a string and returns a boolean indicating whether or not it is a valid name.

def is_valid_name(str)
  parts = str.split(" ")

  if parts.length < 2
    return false
  end

  parts.each do |part|
    if !is_capitalized(part)
      return false
    end
  end

  return true
end

def is_capitalized(word)
  if word[0] == word[0].upcase && word[1..-1] == word[1..-1].downcase
    return true
  else
    return false
  end
end

puts is_valid_name('Kush Patel')       # => true
puts is_valid_name('Daniel')           # => false
puts is_valid_name('Robert Downey Jr') # => true
puts is_valid_name('ROBERT DOWNEY JR') # => false


# Is Valid Email Write a method is_valid_email that takes in a string and returns a boolean indicating whether or not it is a valid email address.

# For simplicity, we'll consider an email valid when it satisfies all of the following:
# - contains exactly one @ symbol
# - contains only lowercase alphabetic letters before the @
# - contains exactly one . after the @

def is_valid_email(str)
	parts = str.split('@')

  if parts.length != 2
    return false
  end


  left = parts[0]
  right = parts[1]
  alph = 'abcdefghijklmnopqrstuvwxyz'

  left.each_char do |char|
    if !alph.include?(char)
      return false
    end
  end

  if right.split('.').length == 2
    return true
  else
    return false
  end
end

puts is_valid_email("abc@xy.z")         # => true
puts is_valid_email("jdoe@gmail.com")   # => true
puts is_valid_email("jdoe@g@mail.com")  # => false
puts is_valid_email("jdoe42@gmail.com") # => false
puts is_valid_email("jdoegmail.com")    # => false
puts is_valid_email("az@email")         # => false


# Write a method array_translate that takes in an array whose elements alternate between words and numbers. The method should return a string where each word is repeated the number of times that immediately follows in the array.

def array_translate(array)
  new_string = ''

  i = 0

  while i < array.length
    name = array[i]
    num = array[i + 1]
    new_string << name * num
    # num.times {new_string += name}
    i += 2
  end

  return new_string
end

print array_translate(["Cat", 2, "Dog", 3, "Mouse", 1]); # => "CatCatDogDogDogMouse"
puts

print array_translate(["red", 3, "blue", 1]); # => "redredredblue"
puts


# Reverse Words
# Write a method reverse_words that takes in a sentence string and
# returns the sentence with the order of the characters in each word reversed.
# Note that we need to reverse the order of characters in the words, do not
# reverse the order of words in the sentence.

def reverse_words(sent)
  order = []

  split = sent.split(' ')
  split.each { |word| order << word.reverse }
  space = order.join(' ')
end

puts reverse_words('keep coding') # => 'peek gnidoc'
puts reverse_words('simplicity is prerequisite for reliability') # => 'yticilpmis si etisiuqererp rof ytilibailer'


# Rotate Array Write a method rotate_array that takes in an array and a number.
# The method should return the array after rotating the elements the specified
# number of times. A single rotation takes the last element of the array and
# moves it to the front.

def rotate_array(arr, num)
  num.times do
    element = arr.pop
    arr.unshift(element)
  end
  arr
end

print rotate_array([ "Matt", "Danny", "Mashu", "Matthias" ], 1) # => [ "Matthias", "Matt", "Danny", "Mashu" ]
puts

print rotate_array([ "a", "b", "c", "d" ], 2) # => [ "c", "d", "a", "b" ]
puts



# Pig Latin Word
# Write a method pig_latin_word that takes in a word string and translates the word into pig latin.

# Pig latin translation uses the following rules:
# - for words that start with a vowel, add 'yay' to the end
# - for words that start with a nonvowel, move all letters before the first vowel to the end of the word and add 'ay'

def pig_latin_word(word)
  vowels = 'aeiou'

  if vowels.include?(word[0])
    return word + 'yay'
  end

  word.each_char.with_index do |char, idx|
    if vowels.include?(char)
      before_vowel = word[0...idx]
      after_vowel = word[idx..-1]
      return after_vowel + before_vowel + 'ay'
    end
  end

end


puts pig_latin_word("apple")   # => "appleyay"
puts pig_latin_word("eat")     # => "eatyay"
puts pig_latin_word("banana")  # => "ananabay"
puts pig_latin_word("trash")   # => "ashtray"



# Combinations
# Write a method combinations that takes in an array of unique elements, the method should return a 2D array representing all possible combinations of 2 elements of the array.

def combinations(arr)
  new_arr = []

  arr.each_with_index do |item1, idx1|
    arr.each_with_index do |item2, idx2|
      new_arr << [ item1, item2 ] if idx2 > idx1
    end
	end

  return new_arr
end

print combinations(["a", "b", "c"]); # => [ [ "a", "b" ], [ "a", "c" ], [ "b", "c" ] ]
puts

print combinations([0, 1, 2, 3]); # => [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 1, 2 ], [ 1, 3 ], [ 2, 3 ] ]
puts



# Opposite Count
# Write a method opposite_count that takes in an array of unique numbers. The method should return the number of pairs of elements that sum to 0.

def opposite_count(nums)
  count = 0

  nums.each_with_index do |num1, idx1|
    nums.each_with_index do |num2, idx2|
      if num1 + num2 == 0 && idx2 > idx1
        count += 1
      end
    end
  end

  return count
end

puts opposite_count([ 2, 5, 11, -5, -2, 7 ]) # => 2
puts opposite_count([ 21, -23, 24 -12, 23 ]) # => 1



# Two D Sum
# Write a method two_d_Sum that takes in a two dimensional array and returns the sum of all elements in the array.

def two_d_sum(arr)
  count = 0

  arr.each do |elements|
    elements.each do |elements|
      count += elements
    end
  end

  return count
end

array_1 = [
  [4, 5],
  [1, 3, 7, 1]
]
puts two_d_sum(array_1)    # => 21

array_2 = [
  [3, 3],
  [2],
  [2, 5]
]
puts two_d_sum(array_2)    # => 15


# Two D Translate
# Write a method two_d_translate that takes in a 2 dimensional array and translates it into a 1 dimensional array. You can assume that the inner arrays always have 2 elements. See the examples.

def two_d_translate(arr)
  new_array = []
  arr.each do |elem|
    multi = elem[1]
    num = elem[0]
    multi.times {new_array << num}
  end

  return new_array
end

arr_1 = [
  ['boot', 3],
  ['camp', 2],
  ['program', 0]
]

print two_d_translate(arr_1) # => [ 'boot', 'boot', 'boot', 'camp', 'camp' ]
puts

arr_2 = [
  ['red', 1],
  ['blue', 4]
]

print two_d_translate(arr_2) # => [ 'red', 'blue', 'blue', 'blue', 'blue' ]
puts
