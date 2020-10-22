# frozen_string_literal: true

# The behavior outlined in the specs will dictate how we ought to design the method in /lib/add.rb.

# /spec/add_spec.rb

require 'add' # this line will include code from "/lib/add.rb"

describe 'add method' do
  it 'should accept two numbers as arguments' do
    expect { add(2, 3) }.to_not raise_error
  end

  it 'should return the sum of the two numbers' do
    expect(add(2, 3)).to eq(5)
    expect(add(10, 12)).to eq(22)
  end
end

# Here's the semantic interpretation of the code:

# The description of the add method outlines 2 criteria:
# it should accept two numbers as arguments
# it should return the sum of the two numbers
# By simply looking at the describe and it lines, we get a clear idea of how add should behave. However, if you need more clarity on the meaning, we can look inside of the expects inside of each it block. Let's hone in on the first it block:

# it "should accept two numbers as arguments" do
# expect { add(2, 3) }.to_not raise_error
# end
# Again, this code reads like english. Here's the somewhat obvious interpretation: The expectation is that when we call the add method and pass it two number arguments like 2 and 3, it should not get an error.

# it "should return the sum of the two numbers" do
# expect(add(2, 3)).to eq(5)
# expect(add(10, 12)).to eq(22)
# end
# the interpretation of the first expect: The expectation is that if we pass the add method 2 and 3 as arguments, it should return the sum, which is equal to 5.

# let's implement it in /lib/add.rb:

# /lib/add.rb
def add(num1, num2)
  num1 + num2
end


# /spec/prime_spec.rb
require 'prime'

describe 'prime? method' do
  it 'should accept a number as an argument' do
    expect { prime?(7) }.to_not raise_error
  end

  context 'when the number is prime' do
    it 'should return true' do
      expect(prime?(7)).to eq(true)
      expect(prime?(11)).to eq(true)
      expect(prime?(13)).to eq(true)
    end
  end

  context 'when the number is not prime' do
    it 'should return false' do
      expect(prime?(4)).to eq(false)
      expect(prime?(9)).to eq(false)
      expect(prime?(20)).to eq(false)
      expect(prime?(1)).to eq(false)
    end
  end
end

# Above we use context additional blocks to outline different scenarios that our code is expected to satisfy. A straight forward interpretation to the first context is: When the number is prime, it should return true.

# Wrapping Up
# the core RSpec terms in every spec file:

# describe names the method being tested
# it expresses the expected behavior of the method being tested
# expect shows how that behavior is tested
