# frozen_string_literal: true

def select_even_nums(arr)
  arr.select(&:even?)
end

def reject_puppies(arr)
  arr.reject { |dog| dog['age'] <= 2 }
end

def count_positive_subarrays(arr)
  arr.count { |sub_arr| sub_arr.sum.positive? }
end

def aba_translate(string)
  vowels = 'aeiou'
  new_word = ''

  string.each_char do |char|
    new_word += if vowels.include?(char)
                  char + 'b' + char
                else
                  char
                end
  end

  new_word
end

def aba_array(arr)
  arr.map { |word| aba_translate(word) }
end

p aba_array(%w[cat dog butterfly])
p aba_array(%w[fly kite])
