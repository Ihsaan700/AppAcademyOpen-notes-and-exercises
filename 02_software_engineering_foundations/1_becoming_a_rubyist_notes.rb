# frozen_string_literal: true

# ==============================================================================
# Use built-in methods
# ==============================================================================
num = 6

# Less preferred
p num % 2 == 0

# Preferred by a Rubyist
p num.even?

people = %w[Joey Bex Andrew]

# Less preferred
p people[people.length - 1]

# Preferred by a Rubyist
p people[-1]
p people.last


# ==============================================================================
# Use enumerables to iterate
# ==============================================================================

# Less preferred
def repeat_hi(num)
  i = 0
  while i < num
    puts 'hi'
    i += 1
  end
end

# Preferred by a Rubyist
def repeat_hi2(num)
  num.times { puts 'hi' }
end

# Given a problem, not all enumerables are equal. Some methods will immediately solve the problem at hand elegantly.

# Less preferred
def all_numbers_even?(nums)
  nums.each do |num|
    return false if num % 2 != 0
  end

  true
end

# Preferred by a Rubyist
def all_numbers_even?(nums)
  nums.all? { |num| num.even? }
end

