module LinkedList
  class Node
    # Has 2 parts:
    # Data Member
    # Link - Next node
    attr_accessor :data, :next

    def initialize(data)
      @data = data
      @next = nil
    end

    def tail?
      @next.nil?
    end

  end
end
