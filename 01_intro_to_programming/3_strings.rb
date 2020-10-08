# frozen_string_literal: true

puts 'hello world how are you doing today'.length
puts 'hello'[0]
puts 'hello' + 'world'

str = 'hello world how are you doing'

i = 4

puts str[i]

i = 0
while i <= 10
  puts i
  i += 1
end

i = 0
while i < str.length
  puts str[i]
  i += 1
end

def print_characters(str)
  i = 0
  while i < str.length
    puts str[i]
    i += 1
  end
end

printCharacters('dog')

str = "hey"

puts "doble doble #{str}"
