class Set

    attr_accessor :entries

    def initialize(*values)
        @entries = values.uniq
    end

    def +(other)
        (self.entries + other.entries).uniq
    end
    
    def -(other)
        (self.entries - other.entries).uniq
    end
    
    def ==(other)
        self.entries.sort == other.to_a.sort
    end
    
    def to_s
        self.entries.to_s
    end
    
    def include?(e)
        self.entries.include?(e)
    end

    def &(other)
        self.entries.select{ |e| other.include?(e) }
    end

    def <<(element)
        self.entries << element
    end
    
    def ^(other)
        self.entries.reject{ |e| other.include?(e) }
    end


end

a = Set.new *%w{a b c}
b = Set.new *%w{c d e}
puts a - b
