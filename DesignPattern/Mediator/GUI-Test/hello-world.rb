# -*- encoding : utf-8 -*-
require 'gtk2'

#Hello, world.というラベルのボタン生成
button = Gtk::Button.new("Hello, world.")
button.signal_connect("clicked") do
  puts "Hello World"
end
window = Gtk::Window.new
window.signal_connect("delete_event") do
  puts "delete event occurred"
  false
end
window.signal_connect("destroy") do
  puts "destroy event occurred"
  Gtk.main_quit
end
window.add(button)
window.show_all

Gtk.main

