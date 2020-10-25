def average(n1, n2)
  (n1 + n2) / 2.0
end

def average_array(nums)
  count = 0
  nums.each { |num| count += num }
  count / (nums.length * 1.0)
end

def repeat(str, num)
  str * num
end

def yell(str)
  str.upcase + '!'
end

def alternating_case(str)
  words = str.split(' ')

  new_words = words.map.with_index do |word, idx|
    if (idx % 2).zero?
      word.upcase
    else
      word.downcase
    end
  end

  new_words.join(' ')
end
