class Node
    attr_accessor :x, :y, :z, :d, :v
    def initialize(x, y, z)
        @x = x
        @y = y
        @z = z
        @d = 9999
        @v = false
    end

    def dist(d)
        self.d = d
    end

    def visit()
        self.v = true
    end
end

def nears(g, n)
    nears = []
    ux, uy, dx, dy = n.x+1, n.y+1, n.x-1, n.y-1

    nears.push(g[n.x+1][n.y]) if ux < g.length
    nears.push(g[n.x][n.y+1]) if uy < g[0].length
    nears.push(g[n.x-1][n.y]) if dx > -1
    nears.push(g[n.x][n.y-1]) if dy > -1
    return nears.select{|ne| !ne.v && ne.z <= n.z + 1}
end

def dij1(g, s, e)
    unvis = g.flatten
    s.dist(0)
    curr = s

    while true
        nears(g, curr).each do |near|
            near.dist([near.d, curr.d + 1].min)
        end
        curr.visit
        unvis.delete_if{|x| x == curr }
        break if e.v
        curr = unvis.min_by(&:d)
    end
    return g.flatten.select(&:v).max_by(&:d).d
end

def dij2(g, s, e)
    unvis = g.flatten
    s.dist(0)
    curr = s

    while true
        nears(g, curr).each do |near|
            if curr.z == 0
                near.dist([near.d, curr.d].min)
            else
                near.dist([near.d, curr.d + 1].min)
            end
        end
        curr.visit
        unvis.delete_if{|x| x == curr }
        break if e.v
        curr = unvis.min_by(&:d)
    end
    return g.flatten.select(&:v).max_by(&:d).d + 1 # fuck knows
end

def read
    gr = []
    s, e = nil, nil
    File.read("i").split("\n").map{|x| x.split("")}.each_with_index do |r, x|
        gr[x] = []
        r.each_with_index do |n, y|
            if n == "S"
                gr[x][y] = Node.new(x, y, 0)
                s = gr[x][y]
            elsif n == "E"
                gr[x][y] = Node.new(x, y, 25)
                e = gr[x][y]
            else
                gr[x][y] = Node.new(x, y, n.ord - 97)
            end
        end
    end
    return gr, s, e
end

puts dij1(*read())
puts dij2(*read())
