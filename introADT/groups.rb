class Set

    #crea un accesor y mutador
    attr_accessor :entries

    #este operador (*) sirve para recibir una cantidad variable de argumentos
    def initialize(*ary)
        @entries = ary
    end

    def +(enum)
        r = @entries.dup
        enum.entries.each do |e|
            r << e unless r.include? e
        end
        Set.new(*r)
    end

    def -(enum)  
        Set.new(*@entries.reject{|e| enum.entries.include? e})
    end

    def each
        @entries.each{|e| yield e}
    end

end

arias = Set.new *['a', "b", 'c', "d"]
otro  = Set.new *%w{b e f g h}

puts "Todos:"
(arias + otro).each {|alumno| puts alumno}

puts "Parejas:"
p ((arias.entries.sort).zip((otro - arias).entries.sort))
