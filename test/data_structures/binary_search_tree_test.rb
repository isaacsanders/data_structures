require 'data_structures/binary_search_tree'

class BinarySearchTreeTest < Test::Unit::TestCase
  attr_reader :tree

  def setup
    @tree = DataStructures::BinarySearchTree.new
  end

  def test_binary_search_tree_insertion
    26.times do
      tree.insert(LessCounter.new)
    end

    counter = SameCounter.new
    assert(tree.insert(counter))
    refute(tree.insert(SameCounter.new))
    assert_includes(tree.in_order, counter)
    assert_equal(27, tree.size)
  end

  def test_in_order_gives_the_sorted_order
    (1..10).each do |n|
      tree.insert(n)
    end

    assert_equal(tree.in_order, (1..10).to_a)
  end

  def test_binary_search_tree_removal
    (1..10).each do |n|
      tree.insert(n)
    end

    assert(tree.remove(1))
  end

  def test_binary_search_tree_get
    126.times do
      tree.insert(LessCounter.new)
    end

    counter = LessCounter.new
    assert(tree.insert(counter))

    assert(tree.get(counter))
  end
end
