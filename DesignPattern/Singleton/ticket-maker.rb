# -*- encoding : utf-8 -*-
require 'singleton'

class TicketMaker
  include Singleton #提供されているSingletonモジュールを読み込む
  def initialize
    @ticket=1000
  end
  def get_next_ticket_number
    @ticket+=1
  end
end

p instance1=TicketMaker.instance #newはprivateメソッドに移されるため外部から呼び出せない
p instance2=TicketMaker.instance
p instance1.get_next_ticket_number
p instance2.get_next_ticket_number

