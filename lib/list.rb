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

    def insert(node, index) # an element at an arbitrary position in the list (Zero-based)
      if @head == nil
        if index == 0
          @head = node
        else
          "Can't insert at that index"
        end
      elsif index == 0
        node.next = @head
        @head = node
      else
        counter = 0
        # Current has to be the node before the node at index we want to insert at
        current = @head
        until (counter + 1) == index
          counter += 1
          current = current.next
        end
        # Assign node.next to current.next
        node.next = current.next
        # Reassign current.next to node
        current.next = node
      end
    end

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

    def head_data # value at the beginning of the list
      if @head == nil
        "List is empty-no data"
      else
        @head.data
      end
    end

    def tail # value at the end of the list
      if @head == nil
        "List is empty-no data"
      else
        current = @head
        until current.tail?
          current = current.next
        end
        current.data
      end
    end

    def find_by_index(index) # find the value at a numeric position
      if @head == nil
        "List is empty-no data"
      else
        current = @head
        counter = 0
        until counter == index
          counter += 1
          current = current.next
        end
        current.data
      end
    end

    def find_by_value(value) # finds the position of the first occurrence of a value
      if @head == nil
        "List is empty-no data"
      else
        position = 0
        current = @head
        until value == current.data
          if current.tail?
            return "Value not found in list"
          else
            position += 1
            current = current.next
          end
        end
        position
      end
    end

    # def remove_by_index(index) # removes the value at the specified index
    #
    # end

    # def remove_by_value(value) # removes the first occurrence of the specified value
    #
    # end

  end
end
