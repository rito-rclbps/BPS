class ImplementDisplay
  def open
  end
  def draw
  end
  def close
  end
end

class ImplementationOfImplementDisplay < ImplementDisplay
  def initialize(string)
    @string=string
    @width=string.length
    p self
  end
  def open
    puts print_line
  end
  def draw
    puts '/* '+@string+' */'
  end
  def close
    puts print_line
  end
  def print_line
    print '/*'+'*'*(@width+2)+'*/'
  end
end
