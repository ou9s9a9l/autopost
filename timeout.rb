require 'watir-webdriver'
browser = Watir::Browser.new :firefox
browser.window.move_to 960, 700
browser.window.resize_to 960, 700
browser_loaded=0
while (browser_loaded == 0)
begin
 browser_loaded=1
 Timeout::timeout(10) do
  browser.goto("bbs.sgamer.com") # goto or click a link
 end
 rescue Timeout::Error => e
  puts "Page load timed out: #{e}"

 end
end
browser.cookies.load 'sg.cookies'
puts 1
browser.goto("http://bbs.sgamer.com/forum-44-1.html")
sleep 300



browser.close
