input = File.read("./input.txt")

# part 1

puts input.count("(") - input.count(")")

# part 2

floor = 0
input.split("").each_with_index do |x, index|
    floor += x == "(" ? 1 : -1
    if floor < -1 then
        puts index
        break
    end
end