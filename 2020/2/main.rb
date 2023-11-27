input = []
File.open("./input.txt").each_line do |line|
    input.push(line.chomp)
end

# part 1

valid = 0
input.each do |e|

    arr = e.split(":")

    letter = arr[0][-1]
    min = arr[0][0..arr[0].index("-")-1]
    max = arr[0][arr[0].index("-")+1..arr[0].index(" ")-1]

    password = arr[1].strip
    
    valid += 1 if (password.count(letter).between?(min.to_i, max.to_i))
    
end
puts valid
    
# part 2
    
valid = 0
input.each do |e|

    arr = e.split(":")

    letter = arr[0][-1]
    min = arr[0][0..arr[0].index("-")-1].to_i() -1
    max = arr[0][arr[0].index("-")+1..arr[0].index(" ")-1].to_i() -1

    password = arr[1].strip
    
    valid += 1 if ((password[min] == letter) ^ (password[max] == letter))
    
end
puts valid