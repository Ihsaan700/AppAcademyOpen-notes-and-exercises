# frozen_string_literal: true

def bubble_sort(arr)
  sorted = true

  while sorted
    sorted = false
    (0...arr.length - 1).each do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        sorted = true
      end
    end
  end

  arr
end

arr = [2, 8, 5, 45, 2, 8, 9, 43, 6, 73, 4, 2, 54, 32, 76, 2, 6]

p bubble_sort(arr)

# ==============================================================================
# Algorithmic Strategies Exercise
# ==============================================================================

# Write a method, swapper(arr, idx1, idx2), that accepts an array and two indices as args.
# The method should swap the elements at the given indices and return the array.
# The method should modify the existing array and not create a new array.

def swapper(arr, idx1, idx2)
  arr[idx1], arr[idx2] = arr[idx2], arr[idx1]
  arr
end

p swapper(%w[a b c d], 0, 2)               # => ["c", "b", "a", "d"]
p swapper(%w[a b c d], 3, 1)               # => ["a", "d", "c", "b"]
p swapper(%w[canal broadway madison], 1, 0) # => ["broadway", "canal", "madison"]


# Write a method, is_sorted(arr), that accepts an array of numbers as an arg.
# The method should return true if the elements are in increasing order, false otherwise.
# Do not use the built-in Array#sort in your solution :)

def is_sorted(arr)
  (arr[0]...arr.length - 1).each do |i|
    return false if arr[i] > arr[i + 1]
  end

  true
end

p is_sorted([1, 4, 10, 13, 15])       # => true
p is_sorted([1, 4, 10, 10, 13, 15])   # => true
p is_sorted([1, 2, 5, 3, 4]) # => false


# Reimplement the bubble sort outlined in the preceding lecture.
# The bubble_sort method should accept an array of numbers and arrange the elements in increasing order.
# The method should return the array.
# Do not use the built-in Array#sort

def bubble_sort(arr)
  sorted = false

  until sorted
    sorted = true

    (0...arr.length - 1).each do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        sorted = false
      end
    end
  end

  arr
end

p bubble_sort([2, 8, 5, 2, 6])      # => [2, 2, 5, 6, 8]
p bubble_sort([10, 8, 7, 1, 2, 3])  # => [1, 2, 3, 7, 8, 10]


# Write a method, peak_finder(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.

def peak_finder(arr)
  peaks = []

  arr.each_with_index do |num, idx|
    left = arr[idx - 1]
    right = arr[idx + 1]
    if idx.zero? && num > right
      peaks << num
    elsif idx == arr.length - 1 && num > left
      peaks << num
    elsif num > left && num > right
      peaks << num
    end
  end

  peaks
end

p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
p peak_finder([1, 3])               # => [3]
p peak_finder([3, 1])               # => [3]


# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
  compressed = ''

  i = 0
  while i < str.length
    char = str[i]

    count = 0
    while char == str[i]
      count += 1
      i += 1
    end

    if count > 1
      compressed += count.to_s + char
    else
      compressed += char
    end
  end

  compressed
end

p compress_str('aaabbc')        # => '3a2bc'
p compress_str('xxyyyyzz')      # => '2x4y2z'
p compress_str('qqqqq')         # => '5q'
p compress_str('mississippi')   # => 'mi2si2si2pi'

