# frozen_string_literal: true

# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
  num.downto(2) do |i|
    return i if (num % i).zero? && prime(i)
  end
end

def prime(num)
  (2...num).none? { |i| (num % i).zero? }
end

def unique_chars?(str)
  already_seen = []

  str.each_char do |char|
    return false if already_seen.include?(char)

    already_seen << char
  end

  true
end

def dupe_indices(arr)
  indices = Hash.new { |h, k| h[k] = [] }
  arr.each_with_index do |char, idx|
    indices[char] << idx
  end

  indices.select { |_k, v| v.length > 1 }
end

def ana_array(arr1, arr2)
  count1 = ele_count(arr1)
  count2 = ele_count(arr2)
  count1 == count2
end

def ele_count(arr)
  count = Hash.new(0)

  arr.each { |i| count[i] += 1 }
  count
end
