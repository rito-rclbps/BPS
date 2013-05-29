# -*- encoding : utf-8 -*-
class Observer
  def update
  end
end

class DigitObserver < Observer
  def initialize(generator)
  end
  def update(generator)
    puts "DigitObserver: #{generator.get_number}"
    sleep(1)
  end
end

class GraphObserver < Observer
  def initialize(generator)
  end
  def update(generator)
    generator.get_number.times do ||
      print "*"
    end
    puts
    sleep(1)
  end
end
