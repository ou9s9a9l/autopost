loop do
puts "Please input x:"      #输出一些文字
x = gets.chomp().to_i           #等待用户用键盘输入信息
if x<2              #以下是判断输入信息及根据输入信息进行引导
y = x+4
else 
y = 2*x
end
puts "The result is:#{y}"            #输出结果
end

lots.include?l.href ？ a=1 : lots<<l.href

if browser.link(id:'fastposturl').exist?
browser_loaded=1
puts "but page already done"
else
browser_loaded=0
puts "but page not done,retry"
end

loop do
  puts "是否发表帖子 是点1"      #输出一些文字
  x = gets.chomp().to_i   
  if x==1
    break
  else
    puts"输入错误"
  end
end