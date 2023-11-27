enc = 0
ori = 0
dec = 0

File.readlines("./input.txt", chomp: true).each do |line|
    enc += line.dump.length
    ori += line.length
    dec += (eval line).length
end

# part 1

puts ori - dec

# part 2

puts enc - ori