require "json"

x = JSON.parse(File.read("i.txt"))

# part 1

NUMS1 = []

def deep1(ele)
    case ele
    when Hash
        ele.each {|k,v| deep1(ele[k])}
    when Array
        ele.each { |e| deep1(e)}
    when Numeric
        NUMS1.push(ele)
    end
end

deep1(x)
puts NUMS1.sum

# part 2

NUMS2 = []

def deep2(ele)
    case ele
    when Hash
        return if ele.values().include? "red"
        ele.each { |k,v|
            deep2(ele[k])
        }
    when Array
        ele.each { |e| deep2(e)}
    when Numeric
        NUMS2.push(ele)
    end
end

deep2(x)
puts NUMS2.sum