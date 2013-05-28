# -*- encoding : utf-8 -*-
class Display
  def initialize(implement)
    @impl=implement
  end
  def open
    @impl.open
  end
  def draw
    @impl.draw
  end
  def close
    @impl.close
  end
  def display
    open
    draw
    close
  end
end

class CountDisplay < Display
  def count_display(count)
    open
    count.times{|i| draw}
    close
  end
end 
