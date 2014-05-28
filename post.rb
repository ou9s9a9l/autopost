require 'watir-webdriver'
def arraysame arr
d=[]
c=0
arr.each do |i|
 b=0
 arr.each do |j|
  if i==j
  b+=1
  end
 end
 
 if b>c
 c=b
 d<<i
 end
end
return c,d.last
end

browser = Watir::Browser.new :firefox
browser.window.move_to 960, 700
browser.window.resize_to 960, 700
browser.goto "http://bbs.sgamer.com/thread-11978714-1-1.html"
browser.link(id:'fastposturl').wait_until_present
#browser.text_field(:class => 'inpu1').set("WebDriver rocks!")
#browser.button(:class => 'loginLink').click
sleep 5
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
puts "得到评论数"+post.length.to_s
content=arraysame post
puts content
browser.textarea(id:'fastpostmessage').set(content.last)
sleep 10
browser.close





