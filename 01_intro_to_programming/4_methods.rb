# frozen_string_literal: true

def say_hello(person)
  puts 'hello ' + person
end

say_hello('ihsaan')

def calc(number1, number2)
  sum = number1 + number2
  avg = sum / 2
  avg
end

result = calc(10, 10)

puts result

def average_of_three(number1, number2, number3)
  sum = number1 + number2 + number3
  new_avg = sum / 3.0
  new_avg
end

puts average_of_three(3, 7, 8)
puts average_of_three(2, 5, 17)
puts average_of_three(2, 8, 1)
