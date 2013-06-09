# -*- encoding: UTF-8 -*-

class Parse
  @@page_list = {}
  def self.make_author_page_list(body)
    body.each_line do |line|
      if line =~ /<li><a href=".+">.+<\/a>.+\(→/
        # なにもしない
      elsif line =~ /<li><a href="(.+)#.+">(.+)<\/a>.+<\/li>/
        # urlとnameを入れる
        @@page_list[$2] = $1
      end
    end
p @@page_list
  end
end
