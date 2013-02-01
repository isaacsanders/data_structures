require 'data_structures/binary_heap'

class BinaryHeapTest < Test::Unit::TestCase
  attr_reader :heap

  def setup
    @heap = DataStructures::BinaryHeap.new
  end

  def test_binary_heap_has_log_n_insertion
    126.times do
      heap.insert(SameCounter.new)
    end

    counter = GreaterCounter.new
    heap.insert(counter)

    assert_equal(counter, heap.first)
    assert_equal(6, heap.first.count)
  end

  def test_min_heap_insertion
    heap = DataStructures::BinaryHeap.new(DataStructures::BinaryHeap::LOW_TO_HIGH)
    126.times do
      heap.insert(SameCounter.new)
    end

    counter = LessCounter.new
    heap.insert(counter)
    assert_equal(counter, heap.first)
    assert_equal(6, heap.first.count)
  end

  def test_binary_heap_has_log_n_removal
    126.times do
      heap.insert(SameCounter.new)
    end


    greater_counter = GreaterCounter.new
    heap.insert(greater_counter)
    less_counter = LessCounter.new
    heap.insert(less_counter)

    assert_equal(greater_counter, heap.remove)
    assert_equal(127, heap.size)
    assert_equal(less_counter, heap.last)
    # 1 comparison on insertion, 6 on removal
    assert_equal(7, heap.last.count)
  end
end
