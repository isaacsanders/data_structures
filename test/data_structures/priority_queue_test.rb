require 'data_structures/priority_queue'

class PriorityQueueTest < Test::Unit::TestCase
  attr_reader :queue

  def setup
    @queue = DataStructures::PriorityQueue.new
  end

  def test_priority_queue_defaults_to_high_priority
    assert(queue.high_priority?)
  end

  def test_high_priority_queue_poll
    126.times do |n|
      queue.offer(Object.new, n)
    end

    object = Object.new
    queue.offer(object, 200)

    assert_equal(object, queue.poll)
  end

  def test_low_priority_queue_poll
    queue = DataStructures::PriorityQueue.low_priority
    100.downto(10) do |n|
      queue.offer(Object.new, n)
    end

    object = Object.new
    queue.offer(object, 1)

    assert_equal(object, queue.poll)
  end
end
