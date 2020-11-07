# How to Create Cats Poorly
cat1 = { name: 'Sennacy', color: 'brown', age: 3 }
cat2 = { name: 'Whiskers', color: 'white', age: 5 }
cat3 = { name: 'Garfield', color: 'orange', age: 7 }

# We want to follow the DRY rule (Don't Repeat Yourself) and improve this code. By using a class we can avoid this repetition and easily create objects of the same structure.

# Creating a Cat Class
# In the cat example above, we can notice a theme across all Cats we create. They all have the same keys, but may differ in their values. We can say that each Cat has the same structure. Let's DRY up the last example by creating a Class to act as a blueprint for Cats.

class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end
end

# A few things we'll want to note about the code above:
# the name of a class must begin with a capital letter
# we can define methods within a class
# We defined a method named initialize in our class. The method expects 3 parameters, @name, @color, etc. are how we denote a instance variable or attribute of our class. That means that our cats will have the attributes or properties of @name, @color, @age.


# Initializing New Cats
# Now that we have a Cat class, we have a blueprint that can easily create Cats.

class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end
end

cat1 = Cat.new('Sennacy', 'brown', 3)
cat2 = Cat.new('Whiskers', 'white', 5)
p cat1 # <Cat:0x007fb6d804cfe0 @age=3, @color="brown", @name="Sennacy">
p cat2 # <Cat:0x007fb6d6bb60b8 @age=5, @color="white", @name="Whiskers">

# when we call Cat.new, ruby will be really calling upon the initialize method we defined. A hint at this is the fact that the initialize method expects a name, color, age and when we call Cat.new we pass in a name, color, age.

# When we call Cat.new("Sennacy", "brown", 3), it will return an object to us that we store in the variable cat1. Notice that the object contains the attributes that result from executing initialize. If we want to create more cats we simply call Cat.new again, passing in any name, color, age we please. We can use the Cat class to create any number of Cat instances. This means that cat1 and cat2 are instances of Cat.

# When we print out an instance of a class, the notation will show which class this instance belongs to and a unique id for this object: <Cat:0x007fb6d804cfe0...


# Getter Methods
# Since we designed a Cat instance to consist of 3 attributes, it's common to also want a way to refer to the value of those attributes. To do this, we define "Getter Methods" to get (return) those attributes. Let's add a name getter to Cat:

class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  def get_name
    @name
  end
end

cat1 = Cat.new('Sennacy', 'brown', 3)
p cat1.get_name # "Sennacy"

# We defined another method called get_name in our class. To call this method, we must call it on a Cat instance, not directly on the Cat class! This makes sense because cat1 is an instance, so it refers to a particular cat. If we had done Cat.get_name we would be incorrectly trying to get the name of the blueprint. Cat is just the blueprint, so it does not refer to any single, particular cat. In summary we should call cat1.get_name and not Cat.get_name.

# By convention, getter methods typically have the same name as the attribute they are returning. So instead of defining get_name, we'll simply define name. Let's add another getter using this convention:

class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  def name
    @name
  end

  def age
    @age
  end
end

cat1 = Cat.new('Sennacy', 'brown', 3)
p cat1.name  # "Sennacy"
p cat1.age   # 3

cat2 = Cat.new('Whiskers', 'white', 5)
p cat2.name  # "Whiskers"
p cat2.age   # 5

p cat2.color # This will give NoMethodError: undefined method `color'

# Getter methods simply return the value of an attribute, we cannot use them to modify the @attribute.


# Setter Methods
# This is what happens when we try to assign to an attribute of a Cat instance without the proper method in place. The following code will not work:

class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  # getter
  def age
    @age
  end
end

cat1 = Cat.new('Sennacy', 'brown', 3)
cat1.age = 42 # NoMethodError: undefined method `age='

# The error we get above suggests that we need to have a age= method on our Cat class.

class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  # getter
  def age
    @age
  end

  # setter
  def age=(number)
    @age = number
  end
end

cat1 = Cat.new('Sennacy', 'brown', 3)
p cat1 # <Cat:0x007f8511a6f340 @age=3, @color="brown", @name="Sennacy">
cat1.age = 42
p cat1 # <Cat:0x007f8511a6f340 @age=42, @color="brown", @name="Sennacy">


# Beyond Getters and Setters
# Getters and setters are common methods to implement on a class, but we can implement any arbitrary method we please on a class. The possibilities are endless:

class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  def purr
    if @age > 5
      puts @name.upcase + ' goes purrrrrr...'
    else
      puts '...'
    end
  end
end

cat1 = Cat.new('Sennacy', 'brown', 10)
cat1.purr  # "SENNACY goes purrrrrr..."

cat2 = Cat.new('Whiskers', 'white', 3)
cat2.purr  # "..."
