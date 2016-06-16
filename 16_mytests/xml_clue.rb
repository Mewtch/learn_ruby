require 'delegate'

class Product
  attr_reader :name, :kind

  def initialize(name, kind)
    @name = name
    @kind = kind
  end
end

class PresentableProduct < SimpleDelegator
  def name
    "<h1>#{super}</h1>"
  end
end

product = Product.new("New Trendy Tablet", "Gadget")
product = PresentableProduct.new(product)

puts product.name   # => <h1>New Trendy Table</h1>
puts product.kind   # => Gadget
puts product.class  # => PresentableProduct