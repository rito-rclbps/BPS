# -*- encoding: UTF-8 -*-
require 'net/http'
require './parse.rb'

aozora_list = [] # 最終的に得るリスト

Net::HTTP.version_1_2
person_all_response = Net::HTTP.start('www.aozora.gr.jp', 80) do |http|
  http.get('/index_pages/person_all.html')
end
Parse.make_author_list(person_all_response.body.force_encoding('utf-8'))
Parse.get_book_list.each do |name, url|
  book_response = Net::HTTP.start('www.aozora.gr.jp', 80) do |http|
    http.get("/index_pages/#{url}")
  end
  booklist1, booklist2 = Parse.make_book_list(book_response.body.force_encoding('utf-8'))
  aozora_list << booklist1.each do |book|
    [name, '公開中の作品', book]
  end
  aozora_list << booklist2.each do |book|
    [name, '作業中の作品', book]
  end
end
p aozora_list
