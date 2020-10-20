# Write a method, replace_char_at!(str, char, idx), that accepts a string, character, and an index as arguments.
# The method should mutate the str by replacing the given idx of the str with the char. The method should return the str.
# Note: this method must MUTATE the input str. This means that the object_id of the input string should be identical to the object_id of the returned string. The exact object_ids you get back don't matter. We just want the ids to be the same before and after calling your method.

def replace_char_at!(str, char, idx)
  str[idx] = char
  str
end


str1 = 'hello'
p str1.object_id                       # => 70120944788380
result1 = replace_char_at!(str1, 'j', 0)
p result1                              # => 'jello'
p result1.object_id                    # => 70120944788380


str2 = 'world'
p str2.object_id                       # => 70120944769940
result2 = replace_char_at!(str2, '!', 2)
p result2                              # => 'wo!ld'
p result2.object_id                    # => 70120944769940


# Write a method, scalar_multiple!(array, multiplier), that accepts an array and a number as args.
# The method should mutate the given array by multiplying all of the elements by the multiplier.
# The method should return the given array.
# Note: this method must MUTATE the input array. This means that the object_id of the input array should be identical to the object_id of the returned array. The exact object_ids you get back don't matter. We just want the ids to be the same before and after calling your method.

def scalar_multiple!(array, multiplier)
  array.map! { |num| num * multiplier }
end


array1 = [7, 0, 4]
p array1.object_id                             # => 70326264380840
result1 = scalar_multiple!(array1, 3)
p result1                                      # => [21, 0, 12]
p result1.object_id                            # => 70326264380840


array2 = [90, 30, 4, 12]
p array2.object_id                             # => 70326264378100
result2 = scalar_multiple!(array2, 0.5)
p result2                                      # => [45.0, 15.0, 2.0, 6.0]
p result2.object_id                            # => 70326264378100


# Write a method, my_rotate!(array, amt), that accepts an array and a number as args.
# The method should mutate the array by rotating the elements 'amt' number of times.
# When given a positive 'amt', a single rotation will rotate left, causing the first element to move to the last index
# When given a negative 'amt', a single rotation will rotate right, causing the last element to move to the first index
# The method should return the given array.
# Do not use the built-in Array#rotate
# Note: this method must MUTATE the input array. This means that the object_id of the input array should be identical to the object_id of the returned array. The exact object_ids you get back don't matter. We just want the ids
# to be the same before and after calling your method.


def my_rotate!(array, amt)
  if amt > 0
    amt.times do
      ele = array.shift
      array << ele
    end
  else
    (-amt).times do
      ele = array.pop
      array.unshift(ele)
    end
  end

  array
end

array1 = %w[a b c d]
p array1.object_id                 # => 70354216023780
result1 = my_rotate!(array1, 2)
p result1                          # => ["c", "d", "a", "b"]
p result1.object_id                # => 70354216023780


array2 = %w[NOMAD SOHO TRIBECA]
p array2.object_id                 # => 70354216019660
result2 = my_rotate!(array2, 1)
p result2                          # => ["SOHO", "TRIBECA", "NOMAD"]
p result2.object_id                # => 70354216019660


array3 = %w[a b c d]
p array3.object_id                 # => 70354216016500
result3 = my_rotate!(array3, -3)
p result3                          # => ["b", "c", "d", "a"]
p result3.object_id                # => 70354216016500


# Write a method, ele_replace!(array, hash), that accepts an array and a hash as args.
# The method should mutate the given array by replacing elements with their corresponding values in the hash.
# The method should return the given array.
#
# Note: this method must MUTATE the input array. This means that the object_id of the input array should be identical
# to the object_id of the returned array. The exact object_ids you get back don't matter. We just want the ids
# to be the same before and after calling your method.

def ele_replace!(array, hash)
  array.map! do |num|
    if hash.keys.include?(num)
      hash[num]
    else
      num
    end
  end
end


array1 = [4, 2, 0, 2]
p array1.object_id         # => 70119569670520
result1 = ele_replace!(array1, { 2 => 'two', 0 => 'zero', 5 => 'five' })
p result1                  # => [4, "two", "zero", "two"]
p result1.object_id        # => 70119569670520


array2 = %w[Matthias Simcha Mashu David]
p array2.object_id         # => 70119569668160
result2 = ele_replace!(array2, 'Matthias' => 'J', 'Mashu' => 'D')
p result2                  # => ["J", "Simcha", "D", "David"]
p result2.object_id        # => 70119569668160


# Write a method, grid(n, m), that accepts two numbers as args.
# The method should return a 2D array with n rows and m columns (this means that there are n subarrays, each of length m).

def grid(n, m)
  Array.new(n) { Array.new(m) }
end

result1 = grid(2, 3)
p result1              # => [[nil, nil, nil], [nil, nil, nil]]
result1[0][0] = 'X'
p result1              # => [["X", nil, nil], [nil, nil, nil]]


result2 = grid(4, 2)
p result2              # => [[nil, nil], [nil, nil], [nil, nil], [nil, nil]]
result2[0][0] = 'Q'
p result2              # => [["Q", nil], [nil, nil], [nil, nil], [nil, nil]]

