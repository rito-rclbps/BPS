class TextBuilder < Builder
  def initialize
    @result=String.new
  end
  def makeTitle(title)
    @result+=title
  end
  def makeString(string)
    @result+=string
  end
  def makeItems(items)
    @result+=items
  end
  def close
    @result+="\n\n***====text closed====***\n\n"
  end
  def getResult
    @result
  end
end

class HTMLBuilder < Builder
end


