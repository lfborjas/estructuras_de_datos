#Estamos "editando" la clase Array para que tenga algunos métodos que una list
#debería tener. En ruby podemos agregar o sobreescribir métodos de 
#una clase en tiempo de ejecución
class Array
    alias :get_at :[]
    def get_first
        self.index self.first or 0
    end

    def end
        self.index(self.last) + 1
    end
end

class Stack < Array
    #procedimiento anula
    alias :purge :clear

    #procedimiento tope
    def peek
        self.get_at self.get_first
    end
    
    #devuelve el elemento que acaba de suprimir
    def pop
        self.delete_at self.get_first
    end
    
    def push(x)
        self.insert self.get_first, x
    end

    #Array ya tiene un método empty?
    alias :is_empty :empty?
end

class Cola < Array
    alias :purge :clear
    
    #el método first de Array ya devuelve el elemento
    #en la primera posición
    alias :front :first

    def enqueue
        self.insert self.end, x
    end

    #el método `shift` ya hace esto...
    alias :dequeue :shift

    alias :is_empty :empty?
end


def eval_rpn(exp)

    ops = {}
    %w{+ - * /}.each do |operation|
        ops[operation] = lambda{|a,b| eval "a #{operation} b"}
    end

=begin
        Lo de arriba equivale a esto:
        ops = {
                "+" => lambda{|a,b| a+b},
                "-" => lambda{|a,b| a-b},
                "*" => lambda{|a,b| a*b},
                "/" => lambda{|a,b| a/b}
              }
=end

    tokens = exp.split /\s+/
    stack  = Stack.new
    for token in tokens
        unless ops.include? token
            stack.push token.to_i
        else
            operands  = []
            operation = ops[token]
            operation.arity.times do
                raise "Insufficient operands" if stack.empty?
                operands << stack.pop
            end
            stack.push operation.call(*operands)
        end
    end

    result = stack.pop
    raise "Unbalanced expression" unless stack.empty?
    result
end

#usar el shunting yard algorithm (http://en.wikipedia.org/wiki/Shunting-yard_algorithm)
#para convertir una expresión en notación infija
def parse_infix(exp)
    tokens = exp.split /\s+/
    raise "Not implemented yet, :P"
end

puts "Escriba una expresión en RPN"
expression = gets.chomp
puts eval_rpn(expression)

puts "Conversión de notación infija a polaca"


