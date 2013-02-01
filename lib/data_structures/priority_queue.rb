require 'data_structures/binary_heap'

module DataStructures
  class PriorityQueue
    extend Forwardable

    def self.low_priority
      new(DataStructures::BinaryHeap::LOW_TO_HIGH)
    end

    def initialize(ordering = DataStructures::BinaryHeap::HIGH_TO_LOW)
      @heap = DataStructures::BinaryHeap.new(ordering)
    end

    def high_priority?
      @heap.max_heap?
    end

    def offer(object, priority)
      @heap.insert(ObjectWithPriority.new(object, priority))
    end

    def poll
      @heap.remove.object
    end

    private

    class ObjectWithPriority < Struct.new(:object, :priority)
      include Comparable

      def <=> other
        priority <=> other.priority
      end
    end
  end
end
