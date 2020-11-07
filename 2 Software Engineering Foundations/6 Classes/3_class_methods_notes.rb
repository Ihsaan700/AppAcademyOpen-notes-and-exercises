# Instance Methods
# An instance method is one that is called on an instance of a class.

class Dog
  def initialize(name, bark)
    @name = name
    @bark = bark
  end

  def speak
    @name + ' says ' + @bark
  end
end

my_dog = Dog.new('Fido', 'woof')
my_dog.speak          # "Fido says woof"

other_dog = Dog.new('Doge', 'much bork')
other_dog.speak       # "Doge says much bork"

# speak is an instance method because we can only call it on a Dog instance we initialised using Dog.new.


# Class Methods
# A class method is a method that is called directly on the class.

class Dog
  def initialize(name, bark)
    @name = name
    @bark = bark
  end

  def self.growl
    'Grrrrr'
  end
end

Dog.growl # Grrrrr

# We define a class method by adding self. to the front of a method name. In this context, self refers to the Dog class itself. Since growl is a class method, we cannot call it on an instance; instead we call it on the Dog class directly . A class method cannot refer to any instance attributes like @name and @bark.

# For example, here is a class method that is a bit more practical, Dog::whos_louder :

class Dog
  def initialize(name, bark)
    @name = name
    @bark = bark
  end

  def self.whos_louder(dog_1, dog_2)
    if dog_1.bark.length > dog_2.bark.length
      dog_1.name
    elsif dog_1.bark.length < dog_2.bark.length
      dog_2.name
    end
  end

  def name
    @name
  end

  def bark
    @bark
  end
end

d1 = Dog.new('Fido', 'woof')
d2 = Dog.new('Doge', 'much bork')
p Dog.whos_louder(d1, d2) # "Doge"


# Wrap Up
# Class#method_name means method_name is an instance method
# Class::method_name means method_name is a class method
