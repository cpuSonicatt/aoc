def calc(dur, speed, endur, rest)
    cycle = endur + rest
    return (dur / cycle * endur + [dur % cycle, endur].min) * speed
end

rdeers = {}

File.readlines("i").each do |i|
    name, speed, endur, rest = /([A-z]+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds./.match(i).captures
    rdeers[name] = calc(2503.to_f, speed.to_i, endur.to_i, rest.to_i)
end

puts rdeers.max_by{|k,v|v}
