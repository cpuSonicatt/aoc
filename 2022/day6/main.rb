require 'enumerator'

def stream(amnt)
    count = amnt
    File.readlines("./input.txt")[0].chars.each_cons(amnt) do |data|
        return count if data.uniq.length == amnt
        count += 1
    end
end

# part 1

puts stream 4

# part 2

puts stream 14