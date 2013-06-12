# -*- encoding : utf-8 -*-
class Product
  def use
  end
end

class Manager
  @@showcase = {}
  def register(name, proto)
    @@showcase[name] = proto
  end  
  def create(protoname)
    proto = @@showcase[protoname].clone
  end
end

class MessageBox < Product
  def initialize (decochar)
    @decochar = decochar
  end
  def use(s)
    width = s.length + ((s.bytesize - s.length) / 2)
    puts @decochar * (width + 4)
    puts "#{@decochar} #{s} #{@decochar}"
    puts @decochar * (width + 4)
    puts
  end
end

class UnderlinePen < Product
  def initialize(ulchar)
    @ulchar = ulchar
  end
  def use(s)
    width = s.length + ((s.bytesize - s.length) / 2)
    puts "\"#{s}\""
    print ' '
    print @ulchar * width
    puts
  end
end

manager = Manager.new
upen = UnderlinePen.new('~')
mbox = MessageBox.new('*')
sbox = MessageBox.new('/')

manager.register('strong message', upen)
manager.register('warning box', mbox)
manager.register('slash box', sbox)

proto1 = manager.create('strong message')
proto2 = manager.create('warning box')
proto3 = manager.create('slash box')
proto1.use('Hello, world.')
proto2.use('Hello, world.')
proto3.use('Hello, world.')

proto2.use('ToLoveる')
proto1.use('びよんど')
