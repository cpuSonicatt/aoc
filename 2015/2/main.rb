input = File.readlines("./input.txt")

# part 1

total = 0
input.each do |paper|
    dim = paper.split("x").map(&:to_i)
    dims = [dim[0] * dim[1], dim[1] * dim[2], dim[2] * dim[0]]
    total += dims.sum * 2 + dims.min
end
puts total

# part 2

total = 0
input.each do |paper|
    dim = paper.split("x").map(&:to_i)
    total += dim.inject(:*)
    dim.sort!
    total += 2 * dim[0] + 2 * dim[1]
end
puts total