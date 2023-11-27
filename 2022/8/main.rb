def visible? x,y,f
    tree = f[y][x].to_i
    f[y][x] = "x"

    left, right = f[y].join.split("x",-1)
    up, down = f.map{|l| l[x]}.join.split("x",-1)

    check(tree,left) || check(tree,right) || check(tree,up) || check(tree,down)
end

def check(tree,x)
    return true if x.empty?
    x = x.split("").map(&:to_i).max
    tree.to_i > x
end

def scenic x,y,f
    tree = f[y][x].to_i
    f[y][x] = "x"

    left, right = f[y].join.split("x",-1)
    left.reverse!
    up, down = f.map{|l| l[x]}.join.split("x",-1)
    up.reverse!
    view(tree,left) * view(tree,right) * view(tree,up) * view(tree,down)
end

def view(tree,x)
    return 0 if x.empty?
    count = 0
    x.split("").map(&:to_i).each do |a|
        count += 1
        break if tree.to_i <= a
    end
    count
end

forest = File.read("./input.txt").split("\n").map(&:chars)
vislist, sceniclist = [], []
h,w = forest[0].length, forest.length

for y in (0...h) do
    for x in (0...w) do
        vislist << visible?(x,y,forest.map(&:clone))
        sceniclist << scenic(x,y,forest.map(&:clone))
    end
end

# part 1

puts vislist.count true

# part 2

puts sceniclist.max