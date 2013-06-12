# -*- encoding: UTF-8 -*-

class AbstractDisplay
  def open; end
  def show; end
  def close; end
  def display
    open
    5.times { show }
    close
  end
end

class CharDisplay < AbstractDisplay
  def initialize(char)
    @char = char
  end
  def open
    print '<<'
  end
  def show
    print @char
  end
  def close
    puts '>>'
  end
end

class StringDisplay < AbstractDisplay
  def initialize(string)
    @string = string
    @width = string.length + (string.bytesize - string.length) / 2
  end
  def open
    print_line
  end
  def show
    puts "|#{@string}|"
  end
  def close
    print_line
  end
  private
  def print_line
    puts '+' + ('-' * @width) + '+'
  end
end

d1 = CharDisplay.new('H')
d2 = StringDisplay.new('Hello, world.')
d3 = StringDisplay.new('こんにちは')
d1.display
d2.display
d3.display

