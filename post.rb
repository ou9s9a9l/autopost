require 'watir-webdriver'

browser = Watir::Browser.new :firefox
browser.window.resize_to 1000, 700
browser.goto "http://bbs.sgamer.com/thread-11967654-1-1.html"
#browser.text_field(:class => 'inpu1').set("WebDriver rocks!")
#browser.button(:class => 'loginLink').click

post=[]
browser.tables.each do|l|
  
     if l.[](0).[](0).outer_html=~/postmessage/
       if l.[](0).[](0).inner_html=~/div/
       else
      post<<l.[](0).[](0).inner_html
    end
    end
end
post.sort
print post
print "文字发送完毕"
sleep 4
browser.close
