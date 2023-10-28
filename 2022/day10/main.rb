require "enumerator"

xreg = 1
xreglist = [""] # fuck you oboe
count = 0
render = []

File.read("./input.txt").split("\n").each do |line|
    inst, amnt = line.split(" ")
    case inst
    when "noop"
        xreglist << xreg
    when "addx"
        xreglist << xreg
        xreglist << xreg
        xreg += amnt.to_i
    end
end

# part 1

[20,60,100,140,180,220].each do |x|
    count += (x * xreglist[x])
end
puts count

# part 2

xreglist.select{|a| a.is_a? Integer}.each_slice(40).each do |a|
    crt = []
    a.each_with_index do |b,x|
        sprite = "."*40
        sprite[b-1], sprite[b], sprite[b+1] = "#","#","#"
        crt << sprite[x]
    end
    render << crt.join
end
puts render