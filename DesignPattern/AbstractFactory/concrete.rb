# -*- encoding: UTF-8 -*-

class ListFactory < Factory
  def create_link(caption, url)
    ListLink.new(caption, url)
  end
  def create_tray(caption)
    ListTray.new(caption)
  end
  def create_page(title, author)
    ListPage.new(title, author)
  end
end

class ListLink < Link
  def initialize(caption, url)
    super
  end
  def make_html
    "  <li><a href=\"#{@url}\">#{@caption}</a></li>\n"
  end
end

class ListTray < Tray
  def initialize(caption)
    super
  end
  def make_html
    buffer = "<li>\n#{@caption}\n<ul>\n"
    @tray.each { |item| buffer << item.make_html }
    buffer << "</ul>\n</li>\n"
  end
end

class ListPage < Page
  def initialize(title, author)
    super
  end
  def make_html
    buffer = "<html><head><title>#{@title}</title></head>\n"
    buffer << "<body>\n<h1>#{@title}</h1>\n<ul>\n"
    @content.each { |item| buffer << item.make_html }
    buffer << "</ul>\n<hr><address>#{@author}</address></body></html>\n"
  end
end

