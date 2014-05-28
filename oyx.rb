require 'watir-webdriver'
def loadlink(mytimeout) 
 browser_loaded=0
 while (browser_loaded == 0)
   begin
   browser_loaded=1
   Timeout::timeout(mytimeout)  do
    yield
   end
   rescue Timeout::Error => e
    puts "Page load timed out: #{e}"
    browser_loaded=0
    puts "retry"
   end
 end
 puts "页面打开完毕"
end
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
delay=10  #网页打开延时
browser = Watir::Browser.new :firefox
browser.window.move_to 960, 700
browser.window.resize_to 960, 700
browser_loaded=0
#打开页面并登陆账号
while (browser_loaded == 0)
loadlink(delay){browser.goto "bbs.sgamer.com"}
browser.cookies.load 'sg.cookies'
loadlink(delay){browser.goto "http://bbs.sgamer.com/forum-44-2.html"}
if browser.textarea(id:'fastpostmessage').exist?
browser_loaded=1
puts "账号登陆成功"
else
browser_loaded=0
puts "账号登陆失败"
end
end
#browser.text_field(:class => 'inpu1').set("WebDriver rocks!")
#browser.button(:class => 'loginLink').click
link=0
lots=[]
replyed=0
loop do
browser.links.each do|l|
  if l.href=~/thread-11\d\d\d\d\d\d-1-/
    if lots.include?l.href
    else
      lots<<l.href
    end
  end
end
loadlink(delay){browser.goto "http://bbs.sgamer.com/forum-44-2.html"}
puts lots
puts lots.length
print "分析完毕，进入帖子"
#帖子内分析
48.times do
  loadlink(delay+20){browser.goto lots[link]}
  link+=1
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
#puts "得到评论数"+post.length.to_s
content=arraysame post
  if content.first>2
    replyed+=1
  print content
  content.last.delete("&nbsp")
  content.last.delete("<br>")
  browser.textarea(id:'fastpostmessage').set(content.last)
  browser.button(id:'fastpostsubmit').click
  everyother=rand(45..120)
  puts replyed,everyother
  sleep everyother
  end
end
end
browser.close


