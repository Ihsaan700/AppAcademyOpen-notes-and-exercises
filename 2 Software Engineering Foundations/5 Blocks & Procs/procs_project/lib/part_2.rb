# frozen_string_literal: true

def reverser(string, &proc)
  proc.call(string.reverse)
end

def word_changer(sentence, &proc)
  new_words = []
  words = sentence.split(' ')

  words.each do |word|
    new_words << proc.call(word)
  end

  new_words.join(' ')
end

def greater_proc_value(number, proc1, proc2)
  if proc1.call(number) > proc2.call(number)
    proc1.call(number)
  else
    proc2.call(number)
  end
end

def and_selector(array, proc1, proc2)
  array.select do |i|
    proc1.call(i) && proc2.call(i)
  end
end

def alternating_mapper(array, proc1, proc2)
  mapped = []

  array.each_with_index do |num, idx|
    mapped << if idx.even?
                proc1.call(num)
              else
                proc2.call(num)
              end
  end

  mapped
end
