# -*- encoding : utf-8 -*-
require './banner.rb'      #Adaptee
require './printbanner.rb' #Adapter
require './print.rb'       #Target

banner = Print.new(PrintBanner.new('Hello'))
banner.print_weak
banner.print_strong
