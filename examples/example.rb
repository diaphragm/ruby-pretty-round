
require "pretty_round"

xs = %w[2.1 2.5 2.9 -2.1 -2.5 -2.9].map(&:to_r)
ns = %w[0.1 0.2 1 2 -0.1 -0.2 -1 -2].map(&:to_r)

header = " "*6  + "|" + ns.map{|x| x.to_f.to_s.rjust(6)}.join + "\n" + "-"*(6+1+6*ns.size)

puts "#mroundup"
puts header
xs.each do |x|
  puts ("%6.1f"%x) + "|" + ns.map{|n| x.mroundup(n)}.map{|n| ("%6.1f"%n)}.join
end
puts

puts "#mrounddown"
puts header
xs.each do |x|
  puts ("%6.1f"%x) + "|" + ns.map{|n| x.mrounddown(n)}.map{|n| ("%6.1f"%n)}.join
end
puts

puts "#mround"
puts header
xs.each do |x|
  puts ("%6.1f"%x) + "|" + ns.map{|n| x.mround(n)}.map{|n| ("%6.1f"%n)}.join
end
puts


puts "#sround"
xs = [0.1234, 12.34, 1234, -0.1234, -12.34, -1234]
ns = [*-1..5]
puts " "*10  + "|" + ns.map{|x| x.to_s.center(10)}.join
puts "-"*(10+1+10*ns.size)
xs.each do |x|
  puts ("% 10.4f"%x) + "|" + ns.map{|n| x.sround(n)}.map{|n| ("% 10.4f"%n)}.join
end

