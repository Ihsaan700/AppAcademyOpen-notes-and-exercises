# frozen_string_literal: true

my_hash = {
  name: 'app academy',
  date: 10,
  sent: ['nope']
}

# Accessing hash by key and assinging a new value
my_hash[:name] = 'new'
my_hash[:date] += 1

# Creating new key:value pair
my_hash[:gender] = 'male'

# Using array method on hash
my_hash[:sent] << 'yes'
my_hash.length

# Checking if hash contains specific value
my_hash.key?(:date)
my_hash.value?(10)

# Accessing keys and values
my_hash.keys[1]
my_hash.keys
my_hash.values


# Iterating through hashes
pizza = {
  style: 'london',
  slices: 8,
  size: '12 inch',
  toppings: %w[chili chicken mushroom],
  is_tasty: true
}

pizza.each do |key, value|
  puts key
  puts value
end

pizza.each_key do |key|
  puts key
end

pizza.each_value do |value|
  puts value
end

# Creating new hash
the_hash = Hash.new('nothing')

the_hash['hey'] = 10

# Convert a string to a hash where every key is a char of the string
str = 'bootcamp prep'
counter = Hash.new(0)
str.each_char { |char| counter[char] += 1 }
puts counter

# Convert a string to a hash and sort it
str2 = 'missisipi river'
counter2 = Hash.new(0)
str2.each_char { |char| counter2[char] += 1 }
sorted = counter2.sort_by { |_key, value| value }
print sorted[-1]


# Get Double Age
# Write a method get_double_age that takes in a hash and returns twice the "age" value of the hash.

def get_double_age(hash)
  hash['age'] *= 2
end

puts get_double_age({ 'name' => 'App Academy', 'age' => 5 }) # => 10
puts get_double_age({ 'name' => 'Ruby', 'age' => 23 })       # => 46


# Get Full Name
# Write a method get_full_name that takes in a hash containing a first, last, and title. The method should return a string representing the hash's full name

def get_full_name(hash)
  hash['first'] + ' ' + hash['last'] + ', the ' + hash['title']
end

hash1 = { 'first' => 'Michael', 'last' => 'Jordan', 'title' => 'GOAT' }
puts get_full_name(hash1) # => "Michael Jordan, the GOAT"

hash2 = { 'first' => 'Fido', 'last' => 'McDog', 'title' => 'Loyal' }
puts get_full_name(hash2) # => "Fido McDog, the Loyal"


# Word Lengths
# Write a method word_lengths that takes in a sentence string and returns a hash where every key is a word of the sentence, and its' corresponding value is the length of that word.

def word_lengths(sentence)
  str_hash = {}
  split = sentence.split(' ')
  split.each { |x| str_hash[x] = split.length }
  str_hash
end

puts word_lengths('this is fun') #=> {"this"=>4, "is"=>2, "fun"=>3}
puts word_lengths('When in doubt, leave it out') #=> {"When"=>4, "in"=>2, "doubt,"=>6, "leave"=>5, "it"=>2, "out"=>3}


# Retrieve Values
# Write a method retrieve_values that takes in two hashes and a key. The method should return an array containing the values from the two hashes that correspond with the given key.

# def retrieve_values(hash1, hash2, key)
#   retrieved = []

#   if key == 'name'
#     retrieved << hash1['name']
#     retrieved << hash2['name']
#   end

#   if key == 'color'
#     retrieved << hash1['color']
#     retrieved << hash2['color']
#   end

#   retrieved
# end

def retrieve_values(hash1, hash2, key)
  val1 = hash1[key]
  val2 = hash2[key]
  [val1, val2]
end


dog1 = { 'name' => 'Fido', 'color' => 'brown' }
dog2 = { 'name' => 'Spot', 'color' => 'white' }
print retrieve_values(dog1, dog2, 'name') #=> ["Fido", "Spot"]
puts
print retrieve_values(dog1, dog2, 'color') #=> ["brown", "white"]
puts


# Cat Builder
# Write a method cat_builder that takes in a name, color, and age. The method should return a hash representing a cat with those values.

def cat_builder(name_str, color_str, age_num)
  # cat = {}

  # cat['name'] = name_str
  # cat['color'] = color_str
  # cat['age'] = age_num

  # cat
  { 'name' => name_str, 'color' => color_str, 'age' => age_num }
end

print cat_builder('Whiskers', 'orange', 3) #=> {"name"=>"Whiskers", "color"=>"orange", "age"=>3}
puts

print cat_builder('Salem', 'black', 100) #=> {"name"=>"Salem", "color"=>"black", "age"=>100}
puts


# Ae Count
# Write a method ae_count that takes in a string and returns a hash containing the number of a's and e's in the string. Assume the string contains only lowercase characters.

def ae_count(str)
  # count_a = 0
  # count_b = 0
  # str.each_char do |char|
  #   count_a += 1 if char == 'a'
  #   count_b += 1 if char == 'e'
  # end
  # { 'a' => count_a, 'e' => count_b }
  count = { 'a' => 0, 'e' => 0 }

  str.each_char do |char|
    count[char] += 1 if char.include?('a') || char.include?('e')
  end
  count
end


puts ae_count('everyone can program') #=> {"a"=>2, "e"=>3}
puts ae_count('keyboard') #=> {"a"=>1, "e"=>1}


# Element Count
# Write a method element_count that takes in an array and returns a hash representing the count of each element in the array.

def element_count(arr)
  count = Hash.new(0)
  arr.each { |ele| count[ele] += 1 }
  count
end

puts element_count(%w[a b a a b]) #=> {'a'=>3, 'b'=>2}
puts element_count(%w[red red blue green]) #=> {'red'=>2, 'blue'=>1, 'green'=>1}


# Select Upcase Keys
# Write a method select_upcase_keys that takes in a hash and returns a new hash containing key-value pairs of the original hash that had uppercase keys. You can assume that the keys will always be strings.


def select_upcase_keys(hash)
  new_hash = {}
  hash.each do |k, v|
    new_hash[k] = v if k == k.upcase
  end
  new_hash
end

print select_upcase_keys({ 'make' => 'Tesla', 'MODEL' => 'S', 'Year' => 2018, 'SEATS' => 4 }) # => {'MODEL'=>"S", 'SEATS'=>4}
puts

print select_upcase_keys({ 'DATE' => 'July 4th', 'holiday' => 'Independence Day', 'type' => 'Federal' }) # => {'DATE'=>'July 4th'}
puts


# Hand Score
# Write a method hand_score that takes in a string representing a hand of cards and returns it's total score. You can assume the letters in the string are only A, K, Q, J. A is worth 4 points, K is 3 points, Q is 2 points, and J is 1 point. The letters of the input string not necessarily uppercase.


def hand_score(hand)
  score = 0
  points = {
    'A' => 4,
    'K' => 3,
    'Q' => 2,
    'J' => 1
  }
  hand.each_char { |letter| score += points[letter.upcase] }
  score
end

puts hand_score('AQAJ') #=> 11
puts hand_score('jJka') #=> 9


# Frequent Letters
# Write a method frequent_letters that takes in a string and returns an array containing the characters that appeared more than twice in the string.

def frequent_letters(string)
  count = []
  freq = Hash.new(0)
  string.each_char { |char| freq[char] += 1 }

  freq.each do |k, v|
    count << k if v > 2
  end
  count
end

print frequent_letters('mississippi') #=> ["i", "s"]
puts
print frequent_letters('bootcamp') #=> []
puts


# Hash To Pairs
# Write a method hash_to_pairs that takes in a hash and returns a 2D array representing each key-value pair of the hash.

def hash_to_pairs(hash)
  pairs = []
  hash.each { |k, v| pairs << [k, v] }
  pairs
end


print hash_to_pairs({ 'name' => 'skateboard', 'wheels' => 4, 'weight' => '7.5 lbs' }) #=> [["name", "skateboard"], ["wheels", 4], ["weight", "7.5 lbs"]]
puts


print hash_to_pairs({ 'kingdom' => 'animalia', 'genus' => 'canis', 'breed' => 'German Shepherd' }) #=> [["kingdom", "animalia"], ["genus", "canis"], ["breed", "German Shepherd"]]
puts


# Unique Elements
# Write a method unique_elements that takes in an array and returns a new array where all duplicate elements are removed. Solve this using a hash.

# Hint: all keys of a hash are automatically unique

def unique_elements(arr)
  uniq = {}
  arr.each { |ele| uniq[ele] = true }
  uniq
end

print unique_elements(%w[a b a a b c]) #=> ['a', 'b', 'c']
puts


# Element Replace
# Write a method element_replace that takes in an array and a hash. The method should return a new array where elements of the original array are replaced with their corresponding values in the hash.


def element_replace(arr, hash)
  new_arr = []

  arr.each do |ele|
    new_arr << if hash.key?(ele)
                 hash[ele]
               else
                 ele
               end
  end
  new_arr
end

arr1 = ['LeBron James', 'Lionel Messi', 'Serena Williams']
hash1 = { 'Serena Williams' => 'tennis', 'LeBron James' => 'basketball' }
print element_replace(arr1, hash1) # => ['basketball', 'Lionel Messi', 'tennis']
puts

arr2 = %w[dog cat mouse]
hash2 = { 'dog' => 'bork', 'cat' => 'meow', 'duck' => 'quack' }
print element_replace(arr2, hash2) # => ['bork', 'meow', 'mouse']
puts
