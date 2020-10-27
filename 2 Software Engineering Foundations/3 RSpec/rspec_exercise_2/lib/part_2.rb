# frozen_string_literal: true

def palindrome?(str)
  str.each_char.with_index do |_char, i|
    return false if str[i] != str[-i - 1]
  end

  true
end

def substrings(str)
  sub_str = []

  (0...str.length).each do |start_idx|
    (start_idx...str.length).each do |end_idx|
      sub_str << str[start_idx..end_idx]
    end
  end

  sub_str
end

def palindrome_substrings(str)
  p_subs = []
  subs = substrings(str)

  subs.each do |i|
    if i.length > 1
      p_subs << i if palindrome?(i)
    end
  end

  p_subs
end
