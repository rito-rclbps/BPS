# -*- encoding: UTF-8 -*-
require 'net/http'
require './parse.rb'

Net::HTTP.version_1_2

person_all_response = Net::HTTP.start('www.aozora.gr.jp', 80) do |http|
  http.get('/index_pages/person_all.html')
end

author_page_list = Parse.make_author_page_list(person_all_response.body.force_encoding('utf-8'))

