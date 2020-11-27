# frozen_string_literal: true

# The broad name for code or syntax that is a 'shortcut' for other code is 'Syntactic Sugar'. For example, attr_reader is syntactic sugar for defining a full getter method. We use syntactic sugar to sweeten up our code, making it more readable.

# Implementing 'operator' Methods
# We can implement +, ==, >, etc.. methods on our classes. Let's say we had a Person class and we wanted to implement equality, ==, on the basis of last_name:

class Person
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def ==(other)
    self.last_name == other.last_name
  end
end

person_1 = Person.new('Jane', 'Doe', 20)
person_2 = Person.new('John', 'Doe', 18)
person_3 = Person.new('John', 'Wayne', 18)

# Calling Person#== without any syntactic sugar is awkward:
p person_1.==(person_2)     # true

# With syntactic sugar, it's much more elegant:
p person_1 == person_2      # true
p person_2 == person_3      # false


# Implementing Bracket Methods
# Say we wanted to have a Queue#[] method to return the element at the given position in the @line, we want to avoid giving direct access to the @line array.

class Queue
  def initialize
    @line = []
  end

  def [](position)
    @line[position]
  end

  def add(ele)
    @line << ele # add ele to back of line
    nil
  end

  def remove
    @line.shift  # remove front ele of line
  end
end

grocery_checkout = Queue.new
grocery_checkout.add('Alan')
grocery_checkout.add('Alonzo')

# Calling Queue#[] without any syntactic sugar is ugly:
grocery_checkout.[](0)          # 'Alan'
grocery_checkout.[](1)          # 'Alonzo'

# With syntactic sugar, it's waaaaay better:
grocery_checkout[0]             # 'Alan'
grocery_checkout[1]             # 'Alonzo'


# Implementing #[]=
# Building off of the #[] method what if we want the ability to assign to a specified position by implementing a #[]= method

class Queue
  def initialize
    @line = []
  end

  def [](position)
    @line[position]
  end

  def []=(position, ele)
    @line[position] = ele
  end

  def add(ele)
    @line << ele # add ele to back of line
    nil
  end

  def remove
    @line.shift  # remove front ele of line
  end
end

grocery_checkout = Queue.new
grocery_checkout.add('Alan')
grocery_checkout.add('Alonzo')

# calling Queue#[]= without syntactic sugar:
grocery_checkout.[]=(0, 'Grace')
p grocery_checkout # <Queue:0x007fe7a7a29ec8 @line=['Grace', 'Alonzo']>

# calling Queue#[]= again, but with syntactic sugar:
grocery_checkout[1] = 'Grace'
p grocery_checkout # <Queue:0x007fe7a7a29ec8 @line=['Grace', 'Grace']>
