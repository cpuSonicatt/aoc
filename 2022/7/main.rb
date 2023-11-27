class Sys
    attr_accessor :strut, :root, :dirlist, :used
    def initialize cmds
        @cmds = cmds
        @root
        @current
        @path = []
        @dirlist = []
        @level = 1
        @cap = 70000000
        @used = 0
    end

    def run
        @cmds.each do |cmd|
            if cmd == "$ cd /" then
                mkroot()
            elsif cmd == "$ ls" then
            elsif cmd == "$ cd .." then
                cdb()
            elsif cmd.include? "$ cd" then
                cd(cmd.split(" ")[2])
            else
                if cmd.include? "dir" then
                    mkdir(cmd.split(" ")[1])
                else
                    touch(*cmd.split(" "))
                end
            end
        end
        @used = @root.calcsize
    end

    def cd(to)
        @level += 1
        @path << to
        @current = @current.get(@path.last)
    end

    def cdb()
        @level -= 1
        @path.pop
        @current = @current.parent
    end

    def mkroot
        d = Dir.new("/",nil,0)
        @path << d.name
        @root = d
        @current = d
        @dirlist << d
    end

    def mkdir(n)
        d = Dir.new(n,@current,@level)
        @current.add d
        @dirlist << d
    end

    def touch(s,n)
        f = Filee.new(n,s.to_i,@level)
        @current.add f
    end

    def unused
        @cap - @used  
    end
end

class Dir
    attr_accessor :size, :name, :parent
    def initialize(n,parent,level)
        @name = n
        @size = 0
        @contains = []
        @parent = parent
        @level = level
    end

    def get(name)
        @contains.select{|d| d.name == name && d.class == Dir}[0]
    end

    def add df
        @contains << df
    end

    def calcsize
        @contains.each do |df|
            @size += df.calcsize
        end
        @size
    end

    def info
        puts ">"*@level + " #{@name} - (dir, #{@size})"
        @contains.each(&:info)
    end
end

class Filee
    attr_accessor :size, :name
    def initialize(n,s,level)
        @name = n
        @size = s
        @level = level
    end

    def calcsize
        @size
    end

    def info
        puts ">"*@level + " #{@name} - (file, #{@size})"
    end

end

sys = Sys.new File.read("./input.txt").split("\n")
sys.run
sys.root.info

# part 1

puts sys.dirlist.map(&:name).join("-")

#part 2

puts sys.dirlist.sort_by{|x| x.size}.select{|x| 30000000 - sys.unused < x.size}[0].size