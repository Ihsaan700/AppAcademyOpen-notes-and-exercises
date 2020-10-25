def hipsterfy(word)
  vowels = 'aeiou'

  i = word.length - 1
  while i >= 0
    return word[0...i] + word[i + 1..-1] if vowels.include?(word[i])

    i -= 1
  end

  word
end

def vowel_counts(str)
  count = Hash.new(0)
  vowels = 'aeiou'

  split = str.downcase.split('')
  split.each do |letter|
    count[letter] += 1 if vowels.include?(letter)
  end

  count
end

def caesar_cipher(msg, num)
  alphabet = 'abcdefghijklmnopqrstuvwxyz'
  new_string = ''

  msg.each_char do |char|
    old_idx = alphabet.index(char)
    new_idx = old_idx + num
    new_char = alphabet[new_idx % 26]
    new_string += new_char
  end

  new_string
end
