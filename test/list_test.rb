require_relative '../lib/list.rb'
require_relative '../lib/node.rb'

class ListTest < Minitest::Test

  def setup
    @list = LinkedList::List.new
    @node1 = LinkedList::Node.new(1)
    @node2 = LinkedList::Node.new(2)
    @node3 = LinkedList::Node.new(3)
  end

  def test_empty_list_has_nil_as_head
    assert_equal nil, @list.head
  end

  def test_can_append_a_node_as_head_to_empty_list
    @list.append(@node2)
    assert_equal @node2, @list.head
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

  # def test_can_insert_a_node_to_an_empty_list
  #   skip
  # end

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

  def test_count_list_with_1_node
    @list
    @list.append(@node1)
    assert_equal 1, @list.count
  end

  def test_count_list_with_2_nodes
    @list
    @list.append(@node1)
    @list.append(@node2)
    assert_equal 2, @list.count
  end

  def test_if_empty_list_returns_








end
