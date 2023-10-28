# input is modified: stack info has been removed, leaving only instructions

class Stack
    def initialize()
        @stacks = {}
    end

    def addstack(id, stack)
        @stacks.store(id, stack.chars)
    end

    def moveA(amnt, from, to)
        crates = from.pop(amnt).reverse
        to.push(crates).flatten!
    end

    def moveB(amnt, from, to)
        crates = from.pop(amnt)
        to.push(crates).flatten!
    end 

    def getstack(id)
        return @stacks[id]
    end

    def output()
        puts @stacks.values.map(&:last).join
    end
end

# part 1

stacks = Stack.new

stacks.addstack(1, "TPZCSLQN")
stacks.addstack(2, "LPTVHCG")
stacks.addstack(3, "DCZF")
stacks.addstack(4, "GWTDLMVC")
stacks.addstack(5, "PWC")
stacks.addstack(6, "PFJDCTSZ")
stacks.addstack(7, "VWGBD")
stacks.addstack(8, "NJSQHW")
stacks.addstack(9, "RCQFSLV")


File.readlines("./input.txt").each do |instruction|
    amnt, from, to = *instruction.scan(/\d+/).map(&:to_i)
    stacks.moveA(amnt, stacks.getstack(from), stacks.getstack(to))
end
stacks.output

# part 2

stacks = Stack.new

stacks.addstack(1, "TPZCSLQN")
stacks.addstack(2, "LPTVHCG")
stacks.addstack(3, "DCZF")
stacks.addstack(4, "GWTDLMVC")
stacks.addstack(5, "PWC")
stacks.addstack(6, "PFJDCTSZ")
stacks.addstack(7, "VWGBD")
stacks.addstack(8, "NJSQHW")
stacks.addstack(9, "RCQFSLV")

File.readlines("./input.txt").each do |instruction|
    amnt, from, to = *instruction.scan(/\d+/).map(&:to_i)
    stacks.moveB(amnt, stacks.getstack(from), stacks.getstack(to))
end
stacks.output