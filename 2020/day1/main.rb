input = []
File.open("./input.txt").each_line do |line| # path to file
    input.push(line.chomp.to_i) # ["12345\n", ...].chomp -> ["12345", ...].to_i -> [12345, ...]
end


# part 1

input.each do |x|
    if input.include?(2020-x) then
        puts x * (2020-x)
        break
    end
end

# part 2

input.each do |x|
    input.each do |y|
        if input.include?(2020-x-y) then
            puts x * y * (2020-x-y)
            break
        end
    end
end