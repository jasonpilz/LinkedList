require_relative './node.rb'

module LinkedList
  class List

    attr_accessor :head

    def initialize(head = nil)
      @head = head
    end

    def append(node) # an element to the end of the list
      if @head.nil?
        @head = node
      else
        here = @head
        until here.tail?
          here = here.next
        end
        here.next = node
      end
    end

    def prepend(node) # an element at the beginning of the list
      if @head == nil
        @head = node
      else
        # Get the current head, and point to it with nodes next pointer
        first = @head
        node.next = first
        # Set the node to the lists head
        @head = node
      end
    end

    # def insert(node) # an element at an arbitrary position in the list
    #   if @head == nil
    #     @head = node
    #   else
    #
    #   end
    # end

    def includes?(value) # gives back true or false if the supplied value is in the list
      return false if @head.nil?
      current = @head
      until current.tail?
        if current.data == value
          return true
        else
          current = current.next
        end
      end
      return false
    end

    def pop # an element from the end of the list
      if @head == nil
        return "No node in list."
      elsif @head.next == nil
          @head = nil
      else
        current = @head
        until current.next.tail?
          current = current.next
        end
        current.next = nil
      end
    end

    def count # the number of elements in the list
      if @head == nil
        return 0
      else
        count = 1
        current = @head
        until current.tail?
          count += 1
          current = current.next
        end
      end
      count
    end

    def head # value at the beginning of the list
      if @head == nil
        return "The list is empty - no head node to return."
      else
        return @head.data
      end
    end

    # def tail # value at the end of the list
    #
    # end

    # def find_by_index # find the value at a numeric position
    #
    # end

    # def find_by_value # finds the position of the first occurrence of a value
    #
    # end

    # def remove_by_index # removes the value at the specified index
    #
    # end

    # def remove_by_value # removes the first occurrence of the specified value
    #
    # end

  end

end



# list = LinkedList::List.new
# list.pop

# node1 = LinkedList::Node.new(1)
# node2 = LinkedList::Node.new(2)
# node3 = LinkedList::Node.new(3)
# node4 = LinkedList::Node.new(4)
# list.append(node1)
# list.append(node2)
# list.append(node3)
# list.append(node4)
# list.inspect
# list.head
