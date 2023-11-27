def s_to_ra(s)
    f,t = *s.split("-")
    return Range.new(f,t).to_a
end

countA, countB = 0, 0

File.readlines("./input.txt").map(&:chomp).each do |ranges|
    a,b = *ranges.split(",").map{|x| s_to_ra(x)}
    a, b = b, a if a.length < b.length
    union = (a | b)
    countA += 1 if union == a || union == b
    countB += 1 if !(a.length + b.length == union.length)
end

puts countA
puts countB
