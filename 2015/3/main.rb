require "set"

instructions = File.readlines("./input.txt")

class Pos
    attr_accessor :x,:y
    def initialize
        @x = 0
        @y = 0

    end
    def hash
        [@x,@y].hash
    end
    def eql? other
        other.instance_of?(self.class) && @x == other.x && @y == other.y
    end
end

# part 1

santa = Pos.new
visited = Set[santa.clone]

instructions.split("").each { |instruction|
    case instruction
        when "^" then santa.y += 1
        when "v" then santa.y -= 1
        when ">" then santa.x += 1
        when "<" then santa.x -= 1
    end
    visited.add santa.clone
}

puts "Houses visited: #{visited.size}"


# part 2

santa = Pos.new
robo = Pos.new
visited = Set[santa.clone]

instructions.split("").each_with_index { |instruction, i|
    which = i.even? ? santa : robo
    case instruction
        when "^" then which.y += 1
        when "v" then which.y -= 1
        when ">" then which.x += 1
        when "<" then which.x -= 1
    end
    visited.add which.clone
}

puts "Houses visited: #{visited.size}"
