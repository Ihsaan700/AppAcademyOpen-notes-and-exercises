# frozen_string_literal: true

# lecture 1
(1..3).each do |num1|
  p num1
  (1..5).each do |num2|
    puts '         ' + num2.to_s
  end
end

(1..3).each do |num1|
  (1..5).each do |num2|
    puts num1.to_s + ' ' + num2.to_s
  end
end

# lecture 2

arr = %w[a b c d e]

arr.each do |e1|
  arr.each do |e2|
    puts e1 + e2 if e1 != e2
  end
end

# iterate through only unique paris
arr = %w[a b c d e]

arr.each_with_index do |e1, x1|
  arr.each_with_index do |e2, x2|
    puts e1 + e2 if x2 > x1
  end
end

# lecture 3, two-domensional arrays

arr = [%w[hey you], 'how', %w[are nice fine], 'you']
