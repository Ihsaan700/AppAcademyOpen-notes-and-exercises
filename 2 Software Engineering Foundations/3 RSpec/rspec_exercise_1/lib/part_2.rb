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
  alphabet = ('a'..'z').to_a
  new_msg = ''

  msg.each_char do |char|
    if alphabet.include?(char)
      old_idx = alphabet.index(char)
      new_idx = old_idx + num
      new_char = alphabet[new_idx % 26]
      new_msg += new_char
    else
      new_msg += char
    end
  end

  new_string
end
