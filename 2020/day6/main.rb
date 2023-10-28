input = File.read("./input.txt").split(/\n{2,}/).map do |x| x.gsub("\n", " ") end

# part 1

total = 0
input.each do |answers|
    alphabet = ("a".."z").to_a
    answers.split(" ").each do |answer|
        alphabet -= answer.split("")
    end
    total += 26 - alphabet.length
end
puts total

# part 2

total = 0
input.each do |answers|
    alphabet = Hash[("a".."z").to_a.collect do |x| [x, 0] end]
    answers.split(" ").each do |answer|
        answer.split("").each do |letter|
            alphabet[letter] += 1
        end
    end
    alphabet.each do |key, value|
        total += 1 if answers.split.length == value
    end
end
puts total