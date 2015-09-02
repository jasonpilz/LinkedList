require_relative '../lib/node.rb'

class NodeTest < Minitest::Test

  def setup
    @node = LinkedList::Node.new(4)
  end

  def test_the_node_has_nil_next_pointer_by_default
    assert_equal nil, @node.next
  end

  def test_the_node_has_correct_data
    assert_equal 4, @node.data
  end

  def test_if_the_node_is_the_tail_by_default
    assert_equal true, @node.tail?
  end

end
