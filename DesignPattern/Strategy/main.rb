# -*- encoding : utf-8 -*-
# 乱数を使ってる割に不自然な結果となる。
require './strategy.rb'
require './hand.rb'

class Player
  def initialize(name, strategy)
    @name = name
    @strategy = strategy.new
    @wincount = 0
    @losecount = 0
    @gamecount = 0
  end
  def next_hand
    @strategy.next_hand
  end
  def win
    @strategy.study(true)
    @wincount += 1
    @gamecount += 1
  end
  def lose
    @strategy.study(false)
    @losecount += 1
    @gamecount += 1
  end
  def even
    @gamecount += 1
  end
  def to_s
    "[#{@name}:#{@gamecount} games, #{@wincount} win, #{@losecount} lose]"
  end
end

player1 = Player.new('Rito', WinningStrategy)
player2 = Player.new('Mikan', ProbStrategy)

(0...10000).each do
  next_hand1 = player1.next_hand
  next_hand2 = player2.next_hand
  if next_hand1.stronger?(next_hand2)
    puts "Winner: #{player1}"
    player1.win
    player2.lose
  elsif next_hand2.stronger?(next_hand1)
    puts "Winner: #{player2}"
    player1.lose
    player2.win
  else
    puts "Even..."
    player1.even
    player2.even
  end
  puts "Total result: \n#{player1}\n#{player2}"
end

