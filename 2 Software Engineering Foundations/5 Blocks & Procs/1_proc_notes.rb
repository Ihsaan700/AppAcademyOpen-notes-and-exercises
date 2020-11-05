# frozen_string_literal: true

# Creating a Proc

# We cannot pass a block into a method, but we can turn the block into a proc and pass that proc into a method to be executed. Think of a proc as a wrapper around a block!

doubler = proc { |num| num * 2 }
p doubler # #<Proc:0x00007f9a8b36b0c8>

# Calling a Proc

# Now that we have a proc, let's execute the code it contains. To do this, we need to use the Proc#call method:

doubler = proc { |num| num * 2 }
p doubler.call(5) # => 10
p doubler.call(7) # => 14

# When calling the proc, we can pass in any arguments the block expects. We can also call the proc as many times as we please! The Proc#call method will evaluate to the last line of code executed within the block. Let's take a look at this with a multiline block:

is_even = proc do |num|
  if num.even?
    true
  else
    false
  end
end

p is_even.call(12) # => true

# Passing a Proc to a Method

def add_and_proc(num1, num2, prc)
  sum = num1 + num2
  p prc.call(sum)
end

doubler = proc { |num| num * 2 }
add_and_proc(1, 4, doubler)   # => 10

square = proc { |num| num * num }
add_and_proc(3, 6, square)    # => 81

negate = proc { |num| -1 * num }
add_and_proc(3, 6, negate)    # => -9

# Version 1: manual, proc accepting method
def add_and_proc(num1, num2, prc)
  sum = num1 + num2
  p prc.call(sum)
end

doubler = proc { |num| num * 2 }
add_and_proc(1, 4, doubler) # => 10


# Version 2: automatic conversion from block to proc
def add_and_proc(num1, num2, &prc)
  sum = num1 + num2
  p prc.call(sum)
end

add_and_proc(1, 4) { |num| num * 2 } # => 10
