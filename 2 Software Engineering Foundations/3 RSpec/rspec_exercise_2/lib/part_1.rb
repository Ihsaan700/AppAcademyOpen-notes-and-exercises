# frozen_string_literal: true

def partition(arr, arg)
  less = []
  greater = []

  arr.each do |num|
    num < arg ? less << num : greater << num
  end

  [less, greater]
end

def merge(hash1, hash2)
  new_hash = {}
  hash1.each { |k, v| new_hash[k] = v }
  hash2.each { |k, v| new_hash[k] = v }
  new_hash
end

def censor(sentence, curse_words)
  words = sentence.split(' ')
  new_words = words.map do |word|
    if curse_words.include?(word.downcase)
      star_vowels(word)
    else
      word
    end
  end

  new_words.join(' ')
end

def star_vowels(str)
  new_string = ''
  vowels = 'aeiou'

  str.each_char { |letter| new_string += vowels.include?(letter.downcase) ? '*' : letter }
  new_string
end

def power_of_two?(num)
  product = 1
  product *= 2 while product < num
  product == num
end
