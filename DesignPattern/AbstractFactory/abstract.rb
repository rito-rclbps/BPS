# -*- encoding: UTF-8 -*-

class Item
  def initialize(caption)
    @caption = caption
  end
  def make_html; end
end

class Link < Item
  def initialize(caption, url)
  super(caption)
  @url = url
  end
end

class Tray < Item
  def initialize(caption)
    super
    @tray = []
  end
  def add(item)
    @tray << item
  end
end

class Page
  def initialize(title, author)
    @title = title
    @author = author
    @content = []
  end
  def add(item)
    @content << item
  end
  def output
    filename = './' + @title + '.html'
    open(filename, 'w') do |f|
      f.write(make_html)
      puts filename + 'を作成しました'
    end
  end
end

class Factory
  def self.get_factory(class_name)
    begin
      eval(class_name).new
    rescue
      warn "#{class_name}が見つかりません。"
    end
  end
  def create_link(caption, url); end
  def create_tray(caption); end
  def create_page(title, author); end
end

