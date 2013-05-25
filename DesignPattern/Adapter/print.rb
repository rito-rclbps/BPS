class Print
  def initialize(adapter)
    @adapter=adapter
  end
  def printWeak
    #p @adapter
    @adapter.printWeak
  end
  def printStrong
    @adapter.printStrong
  end
end
