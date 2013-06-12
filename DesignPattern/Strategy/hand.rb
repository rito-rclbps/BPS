# -*- encoding : utf-8 -*-

class Hand
  attr :hand_value
  GUU = 0; CHO = 1; PAA = 2
  @@name = %w(ぐー ちょき ぱー)
  def initialize(hand_value)
    @hand_value = hand_value
  end
  @@hand = [Hand.new(GUU), Hand.new(CHO), Hand.new(PAA)]
  def self.get_hand(hand_value)
    @@hand[hand_value]
  end
  def stronger?(h)
    fight(h) == 1
  end
  def weaker?(h)
    fight(h) == -1
  end
  protected
  def fight(h)
# 綺麗に書こうとしたらロジックが破綻した
=begin
    0 if @hand_value == h.hand_value
    1 if (@hand_value + 1) % 3 == h.hand_value
    -1 if (@hand_value + 2) % 3 == h.hand_value
=end
    if @hand_value == h.hand_value
      0
    elsif (@hand_value + 1) % 3 == h.hand_value
      1
    else
      -1
    end
  end
  def to_s
    name[@hand_value]
  end
end
