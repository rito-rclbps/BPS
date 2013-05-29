# -*- encoding : utf-8 -*-
require './observer.rb'
require './generator.rb'

generator = RandomNumberGenerator.new
observer1 = DigitObserver.new(generator)
observer2 = GraphObserver.new(generator)
generator.add_observer(observer1)
generator.add_observer(observer2)
generator.execute
