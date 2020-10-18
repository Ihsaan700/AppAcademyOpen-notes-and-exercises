# frozen_string_literal: true

# ==============================================================================
# Bubble Sort
# ==============================================================================

array = %w[a b c d] # let's swap "a" and "b"
temp = array[0];                # save a copy of the first ele
array[0] = array[1];            # overwrite the first ele with the second ele
array[1] = temp;                # overwrite the second ele with the first ele copy
p array

# Swapping Elements
# Like we saw in the previous example, Bubble Sort manipulates the array by swapping the position of two elements. To implement Bubble Sort in Ruby, we'll need to perform this operation, so let's explore it in isolation. A key detail is that we may need an extra temporary variable to store one of the elements since we will be overwriting them in the array:

array = %w[a b c d] # let's swap "a" and "b"
temp = array[0];          # save a copy of the first ele
array[0] = array[1];      # overwrite the first ele with the second ele
array[1] = temp;          # overwrite the second ele with the first ele copy
p array # => ["b", "a", "c", "d"]
# It worked! But hmmm, using that temp variable was kind of messy. Is there an easier way to swap elements of an array? Yep! Ruby has many clean shortcuts:

array = %w[a b c d] # let's swap "a" and "b"
array[0], array[1] = array[1], array[0]
p array # => ["b", "a", "c", "d"]

# As a side note: you can use this swapping mechanic for entire variables as well

food = "mom's spaghetti"
clothing = 'sweater'

food, clothing = clothing, food

p food      # => "sweater"
p clothing  # => "mom's spaghetti"


# Bubble Sort Ruby Implementation
# Using swap and our newfound understanding of Bubble Sort, let's code! Take a look at the snippet below and try to understand how it corresponds to our conceptual understanding of the algorithm. Scroll down to the commented version when you get stuck.

def bubble_sort(array)
  sorted = false
  until sorted
    sorted = true

    (0...array.length - 1).each do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        sorted = false
      end
    end
  end

  array
end

def bubble_sort2(array)
  sorted = false # when this var is false, that means the array is not fully sorted yet

  until sorted # while the array is not sorted...
    sorted = true # reset the sorted flag to true

    # the each below will perform a single 'pass' of bubble sort
    (0...array.length - 1).each do |i|
      if array[i] > array[i + 1] # if adjacent elements are out of order...
        array[i], array[i + 1] = array[i + 1], array[i] # then swap their positions
        sorted = false # since we just made a swap, we may need to perform
      end # an additional 'pass', so set the flag to false
    end
  end

  array
end

