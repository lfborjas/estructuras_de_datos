ary = []

10.times do 
    ary << rand(100) 
end

n = ary.size - 1 

1.upto(n) do |i|
    n.downto(i) do |j|
        if ary[j-1] > ary[j]
            ary[j-1], ary[j] = ary[j], ary[j-1]
        end
    end
end

ary.each do |element|
    puts element
end


