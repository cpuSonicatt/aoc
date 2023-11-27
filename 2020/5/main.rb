input = []
File.open("./input.txt").each_line do |line|
    input.push(line.chomp)
end

id = []

input.each do |pass|

    row = (0..127).to_a
    col = (0..7).to_a

    pass[0..6].split("").each do |letter|
        len = row.length
        rad = len/2
        row = letter == "F" ? row[0...rad] : row[rad...len]
    end

    pass[7..10].split("").each do |letter|
        len = col.length
        rad = len/2
        col = letter == "L" ? col[0...rad] : col[rad...len]
    end

    id.push(rowRange[0] * 8 + colRange[0])
end
            
# part 1

puts id.max
            
# part 2

puts (id.min..id.max).to_a - id