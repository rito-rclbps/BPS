# -*- encoding : utf-8 -*-
require './iterator.rb'
require './aggregate.rb'
require './book.rb'
require './bookshelf.rb'
require './bookshelfiterator.rb'

bookshelf=BookShelf.new(4)
#p bookshelf
#p bookshelf.appendBook(Book.new("Around the World in 80 Days"))
bookshelf.appendBook(Book.new("Around the World in 80 Days"))
bookshelf.appendBook(Book.new("Bible"))
bookshelf.appendBook(Book.new("Cinderella"))
bookshelf.appendBook(Book.new("Daddy-Long-Legs"))
it=bookshelf.iterator
while it.hasNext
  #p  book=it.next
  book=it.next
  puts book.getName
end
