def looksee(x)
    input = "1321131112"
    x.times do
        input = input.chars.chunk(&:itself).map(&:last).map { |y| "#{y.length}#{y[0]}" }.join
    end
    input
end

# part 1

puts looksee(40).length

# part 2

puts looksee(50).length
