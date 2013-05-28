# -*- encoding : utf-8 -*-
require './implementor.rb'
require './abstraction.rb'

d1=Display.new(ImplementationOfImplementDisplay.new("Hello, World"))
d2=CountDisplay.new(ImplementationOfImplementDisplay.new("Hello, Bridge Pattern"))

d1.display
d2.display
d2.count_display(5)
