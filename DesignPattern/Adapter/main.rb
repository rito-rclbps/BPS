require './banner.rb'      #Adaptee
require './printbanner.rb' #Adapter
require './print.rb'       #Target

p=Print.new(PrintBanner.new('Hello'))
p.printWeak
p.printStrong
