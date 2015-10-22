
require "pretty_round"

xs = [1.9, 1.1, -1.1, -1.9]

puts " "*14 + "|" + xs.map{|x| x.to_s.rjust(5)}.join
puts "-"*(14+1+xs.size*5)

%i[ceil floor roundup rounddown round truncate].each do |mthd|
  puts ".#{mthd}".ljust(14)+ "|" + xs.map{|x| x.send(mthd)}.map{|x| x.to_i.to_s.rjust(5)}.join
end

%i[mceil mfloor mroundup mrounddown mround mtruncate].each do |mthd|
  puts ".#{mthd}(1)".ljust(14)+ "|" + xs.map{|x| x.send(mthd,1)}.map{|x| x.to_i.to_s.rjust(5)}.join
end

%i[sceil sfloor sroundup srounddown sround struncate].each do |mthd|
  puts ".#{mthd}(1)".ljust(14)+ "|" + xs.map{|x| x.send(mthd,1)}.map{|x| x.to_i.to_s.rjust(5)}.join
end
