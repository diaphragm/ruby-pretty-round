
require "pretty_round"

puts "* Rounding to nearerst multiple"
xs = %w[2.9 2.5 2.1 -2.1 -2.5 -2.9].map(&:to_r)
ns = %w[0.1 0.2 1 2 -0.1 -0.2 -1 -2].map(&:to_r)

%i[mceil mfloor mroundup mrounddown mround].each do |mthd|
  puts "##{mthd}"
  puts " "*6  + "|" + ns.map{|x| x.to_f.to_s.rjust(6)}.join
  puts "-"*(6+1+6*ns.size)
  xs.each do |x|
    puts ("%6.1f"%x) + "|" + ns.map{|n| x.send(mthd, n)}.map{|n| ("%6.1f"%n)}.join
  end
  puts
end
puts


puts "* Rounding with significant digit"
xs = [0.12345, 123.45, 12345, -0.12345, -123.45, -12345]
ns = [*1..5]

%i[sceil sfloor sroundup srounddown sround].each do |mthd|
  puts "##{mthd}"
  puts " "*13  + "|" + ns.map{|x| x.to_s.center(13)}.join
  puts "-"*(13+1+13*ns.size)
  xs.each do |x|
    puts ("% 13.5f"%x) + "|" + ns.map{|n| x.send(mthd, n)}.map{|n| ("% 13.5f"%n)}.join
  end
  puts
end
