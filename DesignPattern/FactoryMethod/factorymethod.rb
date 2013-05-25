class Factory
  def create(owner)
    product=createProduct(owner)
    registerProduct(product)
    product
  end
  def createProduct
  end
  def registerProduct
  end
end

class Product
  def use
  end
end

class IDCardFactory < Factory
  def initialize
    @owners=Array.new
  end
  def createProduct(owner)
    IDCard.new(owner)
  end
  def registerProduct(card)
    @owners.push(card.getOwner)
  end
  def getOwners
  end
end

class IDCard < Product
  def initialize(owner)
    puts owner + "のカードを作ります。"
    @owner=owner
  end
  def use
    puts @owner + "のカードを使います。"
  end
  def getOwner
    @owner
  end
end

factory=IDCardFactory.new
card1=factory.create "結城梨斗"
card2=factory.create "結城美柑"
card1.use
card2.use
