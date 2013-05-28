# -*- encoding : utf-8 -*-
require './banner.rb'      #Adaptee
require './printbanner.rb' #Adapter
require './print.rb'       #Target

p = Print.new(PrintBanner.new('Hello'))
p.print_weak
p.print_strong
