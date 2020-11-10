# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if empty?

    max - min
  end

  def average
    return nil if empty?

    sum / (length * 1.0)
  end

  def median
    return nil if empty?

    if length.odd?
      middle_index = length / 2
      sort[middle_index]
    else
      sorted = sort
      middle_index = length / 2
      first_ele = sorted[middle_index]
      second_ele = sorted[middle_index - 1]
      (first_ele + second_ele) / 2.0
    end
  end

  def counts
    count = Hash.new(0)
    each { |ele| count[ele] += 1 }
    count
  end

  def my_count(value)
    count = 0

    each do |i|
      if i == value
        count += 1
      end
    end

    count
  end

  def my_index(value)
    each_with_index do |ele, idx|
      return idx if ele == value
    end

    nil
  end

  def my_uniq
    uniq = []
    each do |ele|
      uniq << ele unless uniq.include?(ele)
    end

    uniq
  end

  def my_transpose
    transposed = []

    (0...length).each do |row|
      new_row = []
      (0...length).each do |column|
        new_row << self[column][row]
      end

      transposed << new_row
    end

    transposed
  end
end
