require 'enumerator'

priorityA, priorityB = 0, 0
priority_list = [" ", *("a".."z"), *("A".."Z")]

# part 1

File.readlines("./input.txt").each do |rucksack|

    # takes each rucksack, removes (chomps) the trailing newline, gets the char array, splits the char array in two even halves (Enumerator),
    # converts to array (nested), and assigns each to two array variables.
    comp1, comp2 = *rucksack.chomp.chars.each_slice(rucksack.length/2).to_a

    # the & operator will find the intersection between two arrays (what's common between both)
    priorityA += priority_list.find_index((comp1 & comp2)[0])

end

puts priorityA

# part 2

File.readlines("./input.txt").each_slice(3).to_a.each do |rucksack_trips|

    ruck1, ruck2, ruck3 = *rucksack_trips.map { |rs| rs.chomp.split("") } 
    priorityB += priority_list.find_index((ruck1 & ruck2 & ruck3)[0])

end

puts priorityB