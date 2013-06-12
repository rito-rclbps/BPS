# -*- encoding : utf-8 -*-
class Strategy
  def next_hand; end
  def study(win); end
end

class WinningStrategy < Strategy
  def initialize
    @won = false
    @prev_hand = Hand.get_hand(rand(3))
  end
  def next_hand
    @prev_hand = Hand.get_hand(rand(3)) unless @won
    @prev_hand
  end
  def study(win)
    @won = win
  end
end

class ProbStrategy < Strategy
  def initialize
    @prev_hand_value = 0
    @current_hand_value = 0
    @history = [[1,1,1], [1,1,1], [1,1,1]]
  end
  def next_hand
    #あやしい
    bet = rand(get_sum(@current_hand_value))
    hand_value = if bet < @history[@current_hand_value][0]
      0
    elsif bet < @history[@current_hand_value][0] + @history[@current_hand_value][1]
      1
    else
      2 
    end
    @prev_hand_value = @current_hand_value
    @current_hand_value = hand_value
    Hand.get_hand(hand_value)
  end
  def get_sum(hv)
    sum = 0
    sum = (0...3).each { |i| sum += @history[hv][i] }
  end
  def study(win)
    #このへんもあやしい
    if win
      @history[@prev_hand_value][@current_hand_value] += 1
    else
      @history[@prev_hand_value][(@current_hand_value + 1) % 3] += 1
      @history[@prev_hand_value][(@current_hand_value + 2) % 3] += 1
    end
    p @history
  end
end

