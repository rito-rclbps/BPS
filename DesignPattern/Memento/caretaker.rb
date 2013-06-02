# -*- encoding : utf-8 -*-
require './originator.rb'
require './memento.rb'

gamer = Gamer.new(100)
memento = gamer.create_memento
100.times do |count|
  puts "==== #{count}"
  puts "現状：#{gamer}"
  gamer.bet # Game Start.
  puts "所持金は#{gamer.money}円になりました"
  if gamer.money > memento.money then
    puts "だいぶ増えたので現在の状態を保存しておこう"
    memento = gamer.create_memento
  elsif gamer.money < (memento.money / 2) then
    puts "だいぶ減ったので以前の状態に復帰しよう"
    gamer.restore_memento(memento)
  end
  sleep(1)
end

