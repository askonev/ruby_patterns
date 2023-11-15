# frozen_string_literal: true

# Factory is the abstract class that defines the interface
# for creating products. It has a method create_product,
# which is expected to be implemented by concrete subclasses.
#
# Define Factory class
class Factory

  def create_product
    raise NotImplementedError, 'Subclasses not implement this method'
  end

end

# Define the ConcreteFactory class that extend the Factory
class ConcreteFactory < Factory
  def create_product
    Product.new
  end
end

# Define the Product class
class Product
  def description
    'Im product..'
  end
end

# The Factory Pattern is useful when you want to decouple
# the creation of objects from their usage, making your
# code more maintainable and easier to extend. It's commonly
# used in situations where you need to create objects of
# different types based on some condition or configuration.
factory = ConcreteFactory.new
product = factory.create_product
puts product.description
