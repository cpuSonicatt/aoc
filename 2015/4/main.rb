require 'digest'

def get_salt(input, to)
    salt = 0
    hash = ""
    until hash[0...to] == "0"*to
        salt += 1
        hash = Digest::MD5.hexdigest(input + salt.to_s)
    end
    salt
end

# part 1

puts get_salt("ckczppom", 5)

# part 2
puts get_salt("ckczppom", 6)
