# Factory

Metaprogramming can be used to create a Factory with a more dynamic approach
in Ruby. A factory is a design pattern that is used to create objects without
specifying the exact class of object that will be created. Here's an example
 of a Factory using metaprogramming in Ruby:

```ruby
# Base class for the Factory
class Factory
  def self.create(name, *args)
    # Check if a class with the given name exists
    if Object.const_defined?(name)
      # Dynamically create an instance of the specified class
      Object.const_get(name).new(*args)
    else
      raise NameError, "Class '#{name}' not found"
    end
  end
end

# Define some classes
class ProductA
  def initialize(name)
    @name = name
  end

  def describe
    "I am a ProductA named #{@name}"
  end
end

class ProductB
  def initialize(value)
    @value = value
  end

  def describe
    "I am a ProductB with value #{@value}"
  end
end

# Usage
product1 = Factory.create('ProductA', 'Item 1')
product2 = Factory.create('ProductB', 42)

puts product1.describe
puts product2.describe
```

In this example:

1. The `Factory` class includes a `create` method that takes a class name and
any additional arguments to pass to the constructor. It uses metaprogramming
to check if a class with the given name exists and, if so, dynamically creates
an instance of that class.

2. Two product classes (`ProductA` and `ProductB`) are defined. These classes
have their constructors, and they implement a `describe` method.

3. In the usage section, the `Factory` is used to create instances of the
product classes dynamically based on their class names.

This metaprogramming approach allows you to create objects based on class
names at runtime, making it useful for scenarios where you need to create
objects dynamically without knowing the exact class in advance.
