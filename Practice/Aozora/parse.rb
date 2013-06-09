# -*- encoding: UTF-8 -*-

class Parse
  @@page_list = {} # クラス変数にする意味がなかった
  def self.make_author_list(body)
    body.each_line do |line|
      if line =~ /<li><a href=".+">.+<\/a>.+\(→/
        # なにもしない
      elsif line =~ /<li><a href="(.+)#.+">(.+)<\/a>.+<\/li>/
        # urlとnameを入れる
        @@page_list[$2] = $1
      end
    end
  end
  def self.get_book_list
    @@page_list
  end
  def self.make_book_list(body)
    book_list1 = [] # 公開中
    book_list2 = [] # 作業中
    body.each_line do |line|
      if line =~/<li><a href=".+">(.+)<\/a>.+<\/li>/
        book_list1 << $1
      elsif line =~ /<li>(.+)\t<\/li>/
        book_list2 << $1
      end
    end
    return book_list1, book_list2
  end
end
