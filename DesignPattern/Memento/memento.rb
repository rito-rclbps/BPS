# -*- encoding : utf-8 -*-
class Memento
  attr_reader :money, :fruits

  def initialize(money)
    @money = money # RubyBitsによるとself.moneyと@moneyは同じ意味
    @fruits = []   # attr_accessorを指定しているときはself.の方を使っているみたい
  end              # attr_readerでself.を書くとエラー.
  def add_fruit(fruit)
    @fruits << fruit
  end
end
