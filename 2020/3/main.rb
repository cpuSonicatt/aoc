input = []
File.open("./input.txt").each_line do |line|
    input.push(line.chomp)
end

# part 1

length = input.length
downPos = 0 
acrossPos = 0 

trees = 0
loop do
    downPos += 1 # increment
    acrossPos += 3
    if (input[downPos].length <= acrossPos) then # check repeat
        acrossPos = acrossPos - input[downPos].length
    end
    
    trees += 1 if (input[downPos][acrossPos] == "#") # mark

    break if (downPos == length - 1)
end
puts trees
    
# part 2
    
length = input.length
downPos = [1,1,1,1,2]
acrossPos = [1,3,5,7,1]
total = 1 # because we're multiplying

for x in (0..downPos.length - 1) do
    currDown = 0
    currAcross = 0
    trees = 0
    loop do
        currDown += downPos[x] # increment
        currAcross += acrossPos[x]
        if (input[currDown].length <= currAcross) then # check repeat
            currAcross = currAcross - input[currDown].length
        end
        
        trees += 1 if (input[currDown][currAcross] == "#") # mark

        break if (currDown == length - 1)
    end

    total *= trees
end
puts total