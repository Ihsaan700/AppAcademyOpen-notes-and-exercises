# frozen_string_literal: true

def my_map(arr, &prc)
  mapped = []

  arr.each { |i| mapped << prc.call(i) }

  mapped
end

def my_select(array, &prc)
  selected = []

  array.each do |el|
    selected << el if prc.call(el)
  end

  selected
end

def my_count(array, &prc)
  count = 0

  array.each { |i| count += 1 if prc.call(i) }

  count
end

def my_any?(array, &prc)
  array.each do |i|
    return true if prc.call(i)
  end

  false
end

def my_all?(array, &prc)
  array.each do |i|
    return false if prc.call(i) == false
  end

  true
end

def my_none?(array, &prc)
  array.each do |i|
    return false if prc.call(i)
  end

  true
end
