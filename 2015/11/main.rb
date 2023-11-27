STRAIGHT = -> (s) { Regexp.union( ("a".."z").to_a.each_cons(3).map(&:join) ) === s }
OIL = -> (s) { s.include?("o") || s.include?("i") || s.include?("l") }
TWO_PAIR = -> (s) { s.scan(/(\w)\1/).length > 1 }

def validate(s)
    STRAIGHT.(s) && !OIL.(s) && TWO_PAIR.(s)
end

def run(input)
    input.succ!
    while !validate(input) do
        # puts input
        input.succ!
    end
    input
end

# part 1

puts run "cqjxjnds"

# part 2

puts run "cqjxxyzz"
