scoreA, scoreB = 0, 0
score_shape_map = {"R" => 1, "P" => 2, "S" => 3}
translateA = {
    "A" => "R", "X" => "R",
    "B" => "P", "Y" => "P",
    "C" => "S", "Z" => "S"
}
translateB = {
    "A" => "R", "X" => "L",
    "B" => "P", "Y" => "D",
    "C" => "S", "Z" => "W"
}
@win_map = {
    "P" => "S",
    "R" => "P",
    "S" => "R"
}
@lose_map = @win_map.invert

def play(bot,player)
    return 3 if bot == player
    return 0 if bot == "R" && player == "S" || bot == "S" && player == "P" || bot == "P" && player == "R"
    return 6
end

def determine(bot, should)
    return bot if should == "D"
    return @win_map[bot] if should == "W"
    return @lose_map[bot] if should == "L"
end

# # part 1

File.readlines("./input.txt").each do |strat|
    pred, recc = *strat.split(" ").map { |shape| translateA[shape]}
    scoreA += play(pred, recc) + score_shape_map[recc]
end

puts scoreA

# part 2

File.readlines("./input.txt").each do |strat|
    pred, should = *strat.split(" ").map { |shape| translateB[shape]}
    recc = determine(pred, should)
    scoreB += play(pred, recc) + score_shape_map[recc]
end

puts scoreB