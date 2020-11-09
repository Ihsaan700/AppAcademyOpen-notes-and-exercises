class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @students = []
    @teachers = []
    @grades = Hash.new { |h, k| h[k] = [] }
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(new_teacher)
    @teachers << new_teacher
  end

  def enroll(new_student)
    if @students.count < @student_capacity
      @students << new_student
      return true
    end

    false
  end

  def enrolled?(student)
    @students.include?(student)
  end

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(student, grade)
    if self.enrolled?(student)
      @grades[student] << grade
      return true
    end

    false
  end

  def num_grades(student)
    @grades[student].count
  end

  def average_grade(student)
    if enrolled?(student) && num_grades(student) >= 1
      return @grades[student].sum / @grades[student].length
    end

    nil
  end
end

bootcamp = Bootcamp.new("Map Academy", "Anyone can be a cartographer.", 6)

# bootcamp.enroll("Alice")
# bootcamp.add_grade("Alice", 100)
# bootcamp.add_grade("Alice", 75)
# p bootcamp.average_grade("Alice")
bootcamp.enroll("Bob")
p bootcamp.average_grade("Alice")
p bootcamp.average_grade("Bob")
