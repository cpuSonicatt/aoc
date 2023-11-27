input = File.readlines("./input.txt")

# part 1

nice = 0

three_vowels = -> (str) { str.scan(/[aeiou]/).length > 2 }
two_in_a_row = -> (str) { !str.scan(/(\w)\1/).empty? }
abcdpqxy = -> (str) { !str.scan(/(ab|cd|pq|xy)/).empty? }

input.each do |str|
    next if abcdpqxy.(str)
    nice += 1 if three_vowels.(str) & two_in_a_row.(str)
end
puts nice

# part 2

nice = 0

pair_twice = -> (str) { !str.scan(/(\w\w)\w*\1/).empty? }
pair_split = -> (str) { !str.scan(/(\w)\w{1}\1/).empty? }

input.each do |str|
    nice += 1 if pair_twice.(str) & pair_split.(str)
end
puts nice