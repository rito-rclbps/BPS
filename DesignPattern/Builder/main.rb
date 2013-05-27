require './builder.rb'
require './concrete-builder.rb'
require './director.rb'

text_builder=TextBuilder.new
p text_builder
director=Director.new(text_builder)
director.construct
result=text_builder.getResult
print result
File.open("output_text","w"){|output|
  output.write(result)
}
