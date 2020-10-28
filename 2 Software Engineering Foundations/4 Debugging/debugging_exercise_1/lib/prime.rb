# frozen_string_literal: true

# Debug this code to pass rspec! There are 2 mistakes to fix.

# Write a method, prime?, that accepts a number. It should return a boolean indicating whether or not the given number
# is a prime. A prime number is only divisible by 1 and itself, it should have no other divisors.

require 'byebug'

def prime?(num)
  return false if num < 2

  (2...num).each do |factor|
    return false if num % factor == 0
  end

  true
end

p prime?(7)
p prime?(11)
p prime?(13)
p prime?(4)
p prime?(9)
p prime?(20)
