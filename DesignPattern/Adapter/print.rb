# -*- encoding : utf-8 -*-
class Print
  def initialize(adapter)
    @adapter = adapter
  end
  def print_weak
    #p @adapter
    @adapter.print_weak
  end
  def print_strong
    @adapter.print_strong
  end
end
