# -*- encoding : utf-8 -*-
class TicketMaker
  private_class_method :new #publicだったnewをprivateなクラスメソッドにする

  @@unique_instance
  def initialize
    p "initialize method loaded."
    @ticket_id = 1000
  end
  def self.instance #Use this method to generate an instance.
    @@unique_instance
  end
  def get_next_ticket_number
    @ticket_id += 1
  end
  @@unique_instance = new
end

p instance1 = TicketMaker.instance #initializeが呼ばれない
p instance2 = TicketMaker.instance
p instance1.get_next_ticket_number
p instance2.get_next_ticket_number

