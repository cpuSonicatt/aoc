input = File.readlines("i")

peeps = Hash.new { |h, k| h[k] = h.dup.clear }

input.each do |i|
    person, gl, num, nt = /([A-Za-z]+) would (gain|lose) (\d+) happiness units by sitting next to ([A-Za-z]+)/.match(i).captures
    peeps[person][nt] = (gl == "lose" ? -1 : 1) * num.to_i
end

def neigh(ps, n)
    [
        ps[(ps.find_index(n) + 1) % ps.length],
        ps[(ps.find_index(n) - 1) % ps.length],
    ]
end

def score(peeps, who, with)
    peeps[who][with]
end

# horribly inefficient
def calc(peeps)
    seats = {}
    all = peeps.keys()
    peeps.keys().permutation(all.length).to_a.sort.each do |seat|
        score = 0
        seat.each do |psn|
            r, l = neigh(seat, psn)
            score += score(peeps, psn, r)
            score += score(peeps, psn, l)
        end
        seats[seat] = score
    end
    seats
end

# part 1

puts calc(peeps).max_by{|k,v| v}

# part 2

peeps.keys().each do |pp|
    peeps["Jacq"][pp] = 0
    peeps[pp]["Jacq"] = 0
end
puts peeps

puts calc(peeps).max_by{|k,v| v}
