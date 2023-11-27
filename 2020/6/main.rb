input = File.read("./input.txt").split(/\n{2,}/).map do |x| x.gsub("\n", " ") end

# part 1

total = 0
input.each do |answers|
    total += answers.gsub(" ", "").chars.uniq.length
end
puts total

# part 2

total = 0
input.each do |answers|
    gs = answers.split(" ").length
    ga = answers.gsub(" ", "").chars
    total += ga.group_by{|a| a}.select{|k,v| v.size == gs}.keys.length
end
puts total

