# -*- encoding : utf-8 -*-
class Gamer
  attr_reader :money
  @@fruitsname = ["みかん","ぶどう","りんご","バナナ"]
  def initialize(money)
    @money = money
    @fruits = []
  end
  def bet
    dice = rand(6) + 1
    case dice
    when 1
      @money += 100
      puts "所持金が増えました"
    when 2
      @money /= 2
      puts "所持金が半減しました"
    when 6
      fruit = get_fruit
      puts "フルーツ（#{fruit}）をもらいました"
      @fruits << fruit
    else
      puts "何も起こらなかった" 
    end
  end
  def create_memento
    memento = Memento.new(@money)
    @fruits.each do |fruit|
      memento.add_fruit(fruit) if fruit =~ /^おいしい/
    end
    memento
  end
  def restore_memento(memento)
    @money = memento.money
    @fruits = memento.fruits
  end
  def to_s
    "[money = #{@money}, fruits = #{@fruits}]"
  end
  def get_fruit # もっとうまい書き方がありそう↓
    prefix = ""
    prefix = "おいしい" if rand(2) == 1
    prefix + @@fruitsname[rand(@@fruitsname.length)]
  end
end
