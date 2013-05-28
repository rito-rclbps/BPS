# -*- encoding : utf-8 -*-
class BookShelfIterator < Iterator
  def initialize(bookshelf)
    @index=0
    @bookshelf=bookshelf
  end
  def hasNext
    @index<@bookshelf.getLength
  end
  def next
    currentbook=@bookshelf.getBookAt(@index)
    @index+=1
    currentbook
  end 
end
