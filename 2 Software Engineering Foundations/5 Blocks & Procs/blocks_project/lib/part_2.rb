# frozen_string_literal: true

def all_words_capitalized?(arr)
  arr.all? { |word| word.capitalize == word }
end

def no_valid_url?(urls)
  valid_endings = %w[.com .net .io .org]
  urls.none? do |url|
    valid_endings.any? { |endings| url.end_with?(endings) }
  end
end

def any_passing_students?(students)
  students.any? do |student|
    avg_grade(student[:grades]) > 75
  end
end

def avg_grade(arr)
  arr.sum / (arr.length * 1.0)
end

students_1 = [
  { name: 'Alvin', grades: [70, 50, 75] },
  { name: 'Warlin', grades: [80, 99, 95] },
  { name: 'Vlad', grades: [100] }
]
p any_passing_students?(students_1)
