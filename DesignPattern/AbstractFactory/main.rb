# -*- encoding: UTF-8 -*-
require './abstract'
require './concrete'

exit unless ARGV.length == 1

factory = Factory.get_factory(ARGV[0])

asahi = factory.create_link('朝日新聞', 'http://www.asahi.com/')
yomiuri = factory.create_link('読売新聞', 'http://www.yomiuri.co.jp/')
us_yahoo = factory.create_link('Yahoo!', 'http://www.yahoo.com/')
jp_yahoo = factory.create_link('Yahoo!Japan', 'http://www.yahoo.co.jp/')
excite = factory.create_link('Excite', 'http://www.excite.com/')
google = factory.create_link('Google', 'http://www.google.com/')

traynews = factory.create_tray('新聞')
traynews.add(asahi)
traynews.add(yomiuri)

trayyahoo = factory.create_tray('Yahoo!')
trayyahoo.add(us_yahoo)
trayyahoo.add(jp_yahoo)

traysearch = factory.create_tray('サーチエンジン')
traysearch.add(trayyahoo)
traysearch.add(excite)
traysearch.add(google)

page = factory.create_page('LinkPage', 'rito')
page.add(traynews)
page.add(traysearch)
page.output

