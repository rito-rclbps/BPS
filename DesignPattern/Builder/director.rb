class Director
  def initialize(concrete_builder)
    @builder=concrete_builder
  end
  def construct
    @builder.makeTitle("***title***\n\n")
    @builder.makeString("This is TextBuilder.\n")
    @builder.makeItems("+item1\n"+"+item2\n")
    @builder.close
  end
end
