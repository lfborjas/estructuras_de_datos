module GraphUtil
   def self.to_dot(graph, directed)
       type = directed ? "digraph" : "graph"
       separator = directed ? "->" : "--"
       "\n#{type}{%s}\n"%graph.nodes.collect do |adjacent|
            %Q{#{graph.label}#{separator}#{adjacent.label};}
       end.join("\n")
   end

   def self.to_png(graph, directed=true)
      %x{dot -Tpng -O <<-EOF#{to_dot(graph, directed)}EOF} 
   end

   class Node
       attr_accessor :nodes, :label
       def initialize(label, *nodes)
           @label = label
           @nodes = nodes
       end
   end
end
