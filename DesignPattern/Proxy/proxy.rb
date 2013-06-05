# -*- encoding: UTF-8 -*-

class Printable
  attr_accessor :name
  def show
  end
end

class Printer < Printable
  def initialize(name="")
    self.name = name
    heavy_job
  end
  def show(string)
    puts "===#{name}==="
    puts string
  end
  def heavy_job
    puts "heavy_job started."
    sleep(2)
    puts "heavy_job finished."
  end
end

class PrinterProxy < Printable
  def initialize(name)
    self.name = name
    @real
  end
  def name=(name)
    super # 引数や括弧なしでsuperとだけ書くと引数は渡される。
    @real.name = name unless @real == nil
  end
  def show(name)
    realize
    @real.show(name)
  end
  private
  def realize
    @real = Printer.new(name) if @real == nil
  end
end


proxy = PrinterProxy.new("Alice")
puts "名前は現在#{proxy.name}です。"
proxy.name = "Bob"
puts "名前は現在#{proxy.name}です。"
proxy.show("Hello, world.")
