class Grid
    attr_accessor :grid

    def initialize(size)
        @grid = Array.new(size) { Array.new(size, 0) }
    end

    def pass1(line)
        inst, from, to = *line.scan(/(toggle|(?:turn (?:off|on))) (\d{1,3},\d{1,3}) through (\d{1,3},\d{1,3})/)[0]
        if inst.include? "toggle" then
            toggle(from, to)
        elsif inst.include? "on" then
            change(from, to, 1)
        elsif inst.include? "off" then
            change(from, to, 0)
        end
    end

    def pass2(line)
        inst, from, to = *line.scan(/(toggle|(?:turn (?:off|on))) (\d{1,3},\d{1,3}) through (\d{1,3},\d{1,3})/)[0]
        if inst.include? "toggle" then
            brightness(from, to, 2)
        elsif inst.include? "on" then
            brightness(from, to, 1)
        elsif inst.include? "off" then
            brightness(from, to, -1)
        end
    end

    def toggle(from, to)
        fx, fy, tx, ty = corners(from, to)

        (fx..tx).each do |x|
            (fy..ty).each do |y|
                self.grid[x][y] = self.grid[x][y] == 0 ? 1 : 0
            end
        end
    end

    def change(from, to, onoff)
        fx, fy, tx, ty = corners(from, to)

        (fx..tx).each do |x|
            (fy..ty).each do |y|
                self.grid[x][y] = onoff
            end
        end
    end

    def brightness(from, to, by)
        fx, fy, tx, ty = corners(from, to)

        (fx..tx).each do |x|
            (fy..ty).each do |y|
                val = self.grid[x][y] + by
                self.grid[x][y] = val > 0 ? val : 0
            end
        end
    end

    def corners(from, to)
        [*from.split(",").map(&:to_i), *to.split(",").map(&:to_i)]
    end

    def part1
        x = ""
        self.grid.each_with_index do |row, i|
            x += row.join
        end
        x.count "1"
    end

    def part2
        self.grid.flatten.map { |x| x > 0 ? x : 0}.sum
    end
end

# part 1

g1 = Grid.new 1000
File.readlines("./input.txt").each do |line|
    g1.pass1 line
end
puts g1.part1

# part 2

g2 = Grid.new 1000
File.readlines("./input.txt").each do |line|
    g2.pass2 line
end
puts g2.part2
