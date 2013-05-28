# -*- encoding : utf-8 -*-
class BookShelf < Aggregate
  def initialize(maxsize)
    @books=Array.new(maxsize)
    @last=0
  end
  def getBookAt(index)
    @books[index] 
  end
  def appendBook(book)
    #p @books
    #p @last
    @books[@last]=book
    @last+=1
  end
  def getLength
    @last
  end
  def iterator
    BookShelfIterator.new(self)
  end
end
