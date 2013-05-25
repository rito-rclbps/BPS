class PrintBanner < Banner
  def initialize(string)
    @string=string
  end
  def printWeak
    showWithParen(@string)
  end
  def printStrong
    showWithAster(@string)
  end
end
