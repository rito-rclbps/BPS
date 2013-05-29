# -*- encoding : utf-8 -*-
class NumberGenerator
  def initialize
    @observers = Array.new
  end
  def add_observer(observer)
    @observers.push(observer)
  end
  def delete_observer(observer)
    @observers.delete(observer)
  end
  # すべてのObserverに更新を知らせる
  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end
  # number取得
  def get_number
  end
  # number生成
  def execute
  end
end

class RandomNumberGenerator < NumberGenerator
  def initialize
    @observers = Array.new
    @number
  end
  def get_number
    @number
  end
  def execute
    20.times do ||
      @number = rand(50)
      self.notify_observers
    end
  end
end
