input = File.read("./input.txt").split(/\n{2,}/).map do |x| x.gsub("\n", " ") end.map! do |passport| passport.scan(/(\w+)\:(\S+)/).to_h end

# part 1

puts input.select do |passport|
    (passport.keys & ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]).length == 7
end.size


# part 2

puts input.select do |passport|
    (passport.keys & ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]).length == 7 &&
    passport["byr"].to_i.between?(1920, 2002) &&
    passport["iyr"].to_i.between?(2010, 2020) &&
    passport["eyr"].to_i.between?(2020, 2030) &&
    (
        (passport["hgt"].include?("cm") && passport["hgt"].to_i.between?(150, 193)) || (passport["hgt"].include?("in") && passport["hgt"].to_i.between?(59, 76))
    ) &&
    passport["hcl"] =~ /^#[a-fA-F0-9]{6}$/ &&
    ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].include?(passport["ecl"]) &&
    passport["pid"] =~ /^[0-9]{9}$/

end.size