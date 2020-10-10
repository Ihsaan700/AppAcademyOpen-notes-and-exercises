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


# ==============================================================================
# Common Enumerables
# ==============================================================================

# all?
# Return true when all elements result in true when passed into the block.
p [2, 4, 6].all? { |el| el.even? }  # => true
p [2, 3, 6].all? { |el| el.even? }  # => false

# any?
# Return true when all at least one element results in true when passed into the block.
p [3, 4, 7].any? { |el| el.even? }  # => true
p [3, 5, 7].any? { |el| el.even? }  # => false

# none?
# Return true when no elements of result in true when passed into the block.
p [1, 3, 5].none? { |el| el.even? } # => true
p [1, 4, 5].none? { |el| el.even? } # => false

# one?
# Return true when exactly one element results in true when passed into the block.
p [1, 4, 5].one? { |el| el.even? }  # => true
p [1, 4, 6].one? { |el| el.even? }  # => false
p [1, 3, 5].one? { |el| el.even? }  # => false

# count
# Return a number representing the count of elements that result in true when passed into the block.
p [1, 2, 3, 4, 5, 6].count { |el| el.even? }    # => 3
p [1, 3, 5].count { |el| el.even? }             # => 0

# sum
# Return the total sum of all elements
p [1, -3, 5].sum # => 3

# max and min
# Return the maximum or minimum element
p [1, -3, 5].min    # => -3
p [1, -3, 5].max    # => 5
p [].max            # => nil

# flatten
# Return the 1 dimensional version of any multidimensional array
multi_d = [
    [['a', 'b'], 'c'],
    [['d'], ['e']],
    'f'
]

p multi_d.flatten # => ['a', 'b', 'c', 'd', 'e', 'f']


# ==============================================================================
# Splat Operator Notes
# ==============================================================================

# Using splat to accept additional arguments
# Ruby methods are pretty strict in that we must pass in the exact number of arguments that a method expects. If we pass in too many, we will receive an error:
def method(arg1, arg2)
  p arg1
  p arg2
end

method('a', 'b', 'c', 'd', 'e') # ArgumentError: wrong number of arguments (given 5, expected 2)

# Building upon the code above, if we want our method to have the ability to accept at least two arguments with potentially more, we can add a splat parameter. The additional arguments will be gathered into an array for us to use as we see fit:
def method(arg1, arg2, *other_args)
  p arg1         # 'a'
  p arg2         # 'b'
  p other_args   # ['c', 'd', 'e']
end

method('a', 'b', 'c', 'd', 'e')

# If we pass in exactly two arguments, then other_args will be an empty array:
def method(arg1, arg2, *other_args)
  p arg1         # 'a'
  p arg2         # 'b'
  p other_args   # []
end

method('a', 'b')

# Notice that in any scenario, the arguments are passed in positionally. This means that in the example above, arg_1 is assigned 'a', arg_2 is assigned 'b', and there is no additional data being passed, so other_args is empty.

# As a best practice, we should use splat at the end of the parameter list to avoid confusion. So avoid writing code like this:

# Avoid doing this, it's confusing:
def method(*other_args, required_arg)
  p other_args    # ['a', 'b']
  p required_arg  # 'c'
end

method('a', 'b', 'c')

# Using splat to decompose an array
# We can also use splat to decompose or unpack elements of an array. Let's say we had an array containing some elements, but we wanted each individual element to become an argument:

def greet(first_name, last_name)
  p 'Hey ' + first_name + ', your last name is ' + last_name
end

names = %w[Grace Hopper]
greet(names) # ArgumentError: wrong number of arguments (given 1, expected 2)

# The code above does not work because we are passing in the full array as the first_name, making last_name a missing argument. Thankfully we can use a splat to unpack this array:
def greet(first_name, last_name)
  p 'Hey ' + first_name + ', your last name is ' + last_name
end

names = %w[Grace Hopper]
greet(*names) # => 'Hey Grace, your last name is Hopper'

# When using splat to unpack an array, you can imagine that the * will remove the brackets ([]) that enclose the array. This leaves us with a simple comma separated list, perfect for passing in arguments. If you imagine * as removing the brackets around an array, we can figure out some other creative ways to use this tool:
arr1 = %w[a b]
arr2 = %w[d e]
arr3 = [*arr1, 'c', *arr2]
p arr3 # => ['a', 'b', 'c', 'd', 'e']

# Using splat to decompose a hash
# We can use a double splat (**) to perform a similar unpacking of a hash's key-value pairs. Double splat will only work with hashes where the keys are symbols:

old_hash = { a: 1, b: 2 }
new_hash = { **old_hash, c: 3 }
p new_hash # => {:a=>1, :b=>2, :c=>3}


# ==============================================================================
# Inject
# ==============================================================================

# Ruby's inject method is perhaps the most flexible when it comes to solving different problems. To master its versatility, let's go through the mechanics of how inject works. To avoid confusion, we'll refer to this method as inject, but it is also known as reduce in other programming languages. Ruby has both an inject and a reduce method. Both are functionally identical.

# Inject with only a block
# The most straightforward way to use inject is to call it on an array and pass in a block. Like many enumerables, inject will iterate through the array, passing in the current element to the block. However, what makes inject very versatile is that the block should accept two params, the accumulator and the current element. inject will maintain an accumulator that will change over time, depending on our block. The block should return what the new accumulator should be after a single iteration. This is hard to visualize, so lets take a look at an example:

[11, 7, 2, 4].inject { |acc, el| acc + el }
# Notice that the block params are always in the order of accumulator (acc) followed by element (el). Let's now explore inject in action. Because of how we are calling inject, the initial accumulator will be the first element of the array by default. So our first iteration has the acc set to 11 and el set to 7.

# FIRST ITERATION:
# acc = 11
# el = 7
# new_acc = 18
[11, 7, 2, 4].inject { |acc, el| acc + el }
# Since the block results in 11 + 7, 18 will be assigned to acc in the next iteration. The el simply iterates to the next element of the array:

# SECOND ITERATION:
# acc = 18
# el = 2
# new_acc = 20
[11, 7, 2, 4].inject { |acc, el| acc + el }
# Now the acc is 20 and we have to do one more iteration for the last el:

# acc = 20
# el = 4
# new_acc = 24
p [11, 7, 2, 4].inject { |acc, el| acc + el } # => 24
# Since we are done iterating through all elements, inject will return the final accumulator. We were able to add up all elements of the array using inject! If you're not convinced of how useful inject is, you're probably thinking why don't we use a simpler loop or just use the Array#sum method. inject is an awesome method because of how versatile it is.

# Applying our same steps as before, we'll leave it to you to ponder how inject can also find the total product of an array:

p [11, 7, 2, 4].inject { |acc, el| acc * el } # => 616
# Or how about finding the minimum value in an array:

p [11, 7, 2, 4].inject do |acc, el|
  if el < acc
    el
  else
    acc
  end
end # => 2
# Because the result of the block is always reassigned to be the new accumulator, we needed to return the current acc in the event that the el we are iterating through is not smaller than the acc. The else is necessary to avoid our block from resulting in nil.

# The key to understanding inject is to remember that the accumulator will be reassigned to the result of the block on every iteration. Because inject performs a simple reassignment to the accumulator, we can design any block to control how the accumulator should change.

# Inject with a default accumulator
# In the last examples we described how the first element of the array will become the initial accumulator and the first iteration technically grabs the second element. We can also use inject by passing in our own initial accumulator. In this scenario, the acc will be our own value and the first el will be the first element of the array. Let's make 100 our initial accumulator:

# FIRST ITERATION:
# acc = 100
# el = 11
# new_acc = 111
[11, 7, 2, 4].inject(100) { |acc, el| acc + el }
# SECOND ITERATION
# acc = 111
# el = 7
# new_acc = 118
[11, 7, 2, 4].inject(100) { |acc, el| acc + el }
# THIRD ITERATION
# acc = 118
# el = 2
# new_acc = 120
[11, 7, 2, 4].inject(100) { |acc, el| acc + el }
# FOURTH ITERATION
# acc = 120
# el = 4
# new_acc = 124
p [11, 7, 2, 4].inject(100) { |acc, el| acc + el } # => 124
# Nice! Being able to set our own initial accumulator can really open up our possibilities. Here's an inject that sums up all even numbers of an array:

[11, 7, 2, 4].inject(0) do |acc, el|
  if el.even?
    acc + el
  else
    acc
  end
end # => 6
