calos = []
group = 0
File.readlines("./input.txt").each do |num|
    if num != "\n" then
        group += num.to_i
    else
        calos.push group.to_i
        group = 0
    end
end
calos.sort!

# part 1

puts calos[-1]

# part 2

puts calos[-1] + calos[-2] + calos[-3]