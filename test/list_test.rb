require_relative '../lib/list.rb'
require_relative '../lib/node.rb'

class ListTest < Minitest::Test
  def setup
    @list = LinkedList::List.new
    @node1 = LinkedList::Node.new(1)
    @node2 = LinkedList::Node.new(2)
    @node3 = LinkedList::Node.new(3)
    @node4 = LinkedList::Node.new(4)
  end


  def test_empty_list_has_nil_as_head
    list = LinkedList::List.empty
    assert_equal nil, list.head
  end

  def test_can_append_a_node_as_head_to_empty_list
    list = LinkedList::List.empty
    list.append(@node2)
    assert_equal @node2, list.head
  end

  def test_can_append_a_node_to_another_node
    @list.append(@node1)
    @list.append(@node2)
    assert_equal @node2, @node1.next
  end

  def test_can_append_a_node_to_a_list_of_two
    @list.append(@node1)
    @list.append(@node2)
    @list.append(@node3)
    assert_equal @node1, @list.head
    assert_equal @node2, @node1.next
    assert_equal @node3, @node2.next
    assert_equal true, @node3.tail?
  end

  def test_can_prepend_a_node_to_an_empty_list
    @list.prepend(@node1)
    assert_equal @node1, @list.head
  end

  def test_can_prepend_a_node_to_a_list_with_another_node
    @list.prepend(@node1)
    @list.prepend(@node2)
    assert_equal @node2, @list.head
    assert @node1.tail?
  end

  def test_can_insert_a_node_to_an_empty_list
    @list
    @list.insert(@node2, 0)
    assert_equal @node2, @list.head
  end

  def test_can_insert_a_node_at_higher_index_than_list_length_returns_error
    assert_raises "Can't insert at that index" do
      @list.insert(@node2, 2)
    end
  end

  def test_can_insert_a_node_to_a_list_at_arbitrary_position
    @list
    @list.append(@node1)
    @list.append(@node2)
    @list.append(@node3)
    @list.insert(@node4, 1)
    assert_equal @node4, @list.head.next
    assert_equal @node2, @node4.next
    assert_equal @node3, @node2.next
  end

  def test_if_given_value_in_empty_list_returns_false
    refute @list.includes?(4)
  end

  def test_if_given_value_in_list_returns_true
    @list.append(@node1)
    @list.append(@node2)
    assert @list.includes?(1)
  end

  def test_if_given_value_not_in_list_returns_false
    @list.append(@node1)
    @list.append(@node2)
    refute @list.includes?(9)
  end

  def test_pop_a_node_from_empty_list_returns_message
    @list
    assert_equal "No node in list.", @list.pop
  end

  def test_pop_a_node_from_list_containing_one_node
    @list.append(@node1)
    @list.pop
    assert_equal nil, @list.head
  end

  def test_pop_a_node_from_list_containing_two_nodes
    @list.append(@node1)
    @list.append(@node2)
    assert_equal @node2, @node1.next
    @list.pop
    assert_equal nil, @node1.next
  end

  def test_count_empty_list_returns_0
    @list
    assert_equal 0, @list.count
  end

  def test_count_a_non_empty_list
    @list.append(@node1)
    assert_equal 1, @list.count
    @list.append(@node2)
    assert_equal 2, @list.count
  end

  def test_if_empty_list_returns_no_head_data
    @list
    assert_equal "List is empty-no data", @list.head_data
  end

  def test_if_list_with_2_nodes_returns_head_data
    @list
    @list.append(@node2)
    @list.append(@node1)
    assert_equal 2, @list.head_data
  end

  def test_empty_list_returns_no_tail_data
    @list
    assert_equal "List is empty-no data", @list.tail
  end

  def test_if_list_with_2_nodes_returns_tail_data
    @list
    @list.append(@node1)
    @list.append(@node2)
    assert_equal 2, @list.tail
  end

  def test_can_find_value_by_index_in_empty_list
    @list
    assert_equal "List is empty-no data", @list.find_by_index(0)
  end

  def test_can_find_value_by_index_in_list_with_3_nodes
    @list
    @list.append(@node1)
    @list.append(@node3)
    @list.append(@node2)
    assert_equal 1, @list.find_by_index(0)
    assert_equal 3, @list.find_by_index(1)
    assert_equal 2, @list.find_by_index(2)
  end

  def test_can_fin_position_by_value_in_empty_list
    @list
    assert_equal "List is empty-no data", @list.find_by_value(2)
  end

  def test_can_find_posiiton_by_value_in_list_with_1_node
    @list
    @list.append(@node1)
    assert_equal 0, @list.find_by_value(1)
    assert_equal "Value not found in list", @list.find_by_value(3)
  end

  def test_can_find_position_by_value_in_list_with_2_nodes
    @list
    @list.append(@node2)
    @list.append(@node1)
    assert_equal 0, @list.find_by_value(2)
  end
end
