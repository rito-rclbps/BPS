# -*- encoding: UTF-8 -*-

class Display
  def get_columns; end
  def get_rows; end
  def get_rowtext(row); end
  def show
    (0...get_rows).each do |i|
      puts get_rowtext(i)
    end
  end
end

class StringDisplay < Display
  def initialize(string)
    @string = string
  end
  def get_columns
    @string.length + (@string.bytesize - @string.length) / 2
  end
  def get_rows
    1
  end
  def get_rowtext(row)
    @string if row == 0
  end
end

class Border < Display
  def initialize(display)
    @display = display
  end
end

class SideBorder < Border
  def initialize(display, ch)
    super(display)
    @border_char = ch
  end
  def get_columns
    1 + @display.get_columns + 1
  end
  def get_rows
    @display.get_rows
  end
  def get_rowtext(row)
    @border_char + @display.get_rowtext(row)+@border_char
  end
end

class FullBorder < Border
  def initialize(display)
    super
  end
  def get_columns
    1 + @display.get_columns + 1
  end
  def get_rows
    1 + @display.get_rows + 1
  end
  def get_rowtext(row)
    if((row == 0) || (row == @display.get_rows + 1))
      "+#{'-' * @display.get_columns}+"
    else
      "|#{@display.get_rowtext(row - 1)}|"
    end
  end
end

b1 = StringDisplay.new('Hello, world')
b2 = SideBorder.new(b1, '#')
b3 = FullBorder.new(b2)
b1.show
b2.show
b3.show
b4 = SideBorder.new(FullBorder.new(FullBorder.new(SideBorder.new(FullBorder.new(StringDisplay.new('こんにちは')),'*'))),'/')
b4.show

