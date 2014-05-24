require 'watir-webdriver'

browser = Watir::Browser.new :firefox
browser.window.resize_to 1000, 700
browser.goto "http://bbs.sgamer.com/forum-44-2.html"
#browser.text_field(:class => 'inpu1').set("WebDriver rocks!")
#browser.button(:class => 'loginLink').click
link=3
lots=[]
print lots
browser.links.each do|l|
  
  if l.href=~/thread-11\d\d\d\d\d\d-1-/
    if link==0
      lots<<l.href
      link=3
    end
    link-=1
  end
end
print "分析完毕，进入帖子"
browser.goto lots[0]
sleep 4
browser.close

browser.tables.each do |l|
  puts l.[](0).[](0).inner_html
end
