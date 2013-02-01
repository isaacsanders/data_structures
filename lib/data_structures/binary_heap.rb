module DataStructures
  class BinaryHeap < Array
    # The Binary Heap is a Max Heap by default.
    # In order to make it Min Heap, pass DataStructures::BinaryHeap::LOW_TO_HIGH
    # as the parameter to the constructor.
    HIGH_TO_LOW = 1
    LOW_TO_HIGH = -1

    def initialize(ordering = HIGH_TO_LOW)
      @ordering = ordering
      @last_index = 0
    end

    def insert(element)
      index = @last_index
      push(element)
      while has_parent_at?(index) && in_wrong_order_with_parent?(element, parent_of(index))
        swap_with_parent(index)
        index = parent_index(index)
      end
      @last_index += 1
    end

    def remove
      if size == 0
        return nil
      else
        value = shift
        parent = pop
        unshift(parent)
        index = 0
        bubble_down(index)
        value
        # Compare the new root with its children; if they are in the correct order, stop.
        # If not, swap the element with one of its children and return to the previous step.
        # (Swap with its smaller child in a min-heap and its larger child in a max-heap.)
      end
    end

    def min_heap?
      @ordering == LOW_TO_HIGH
    end

    def max_heap?
      @ordering == HIGH_TO_LOW
    end

    private

    def bubble_down(index)
      while in_wrong_order_with_children?(index)
        if has_two_children_at?(index)
          if ((left_child(index) <=> right_child(index)) / @ordering) > 0
            swap_with_parent(left_child_index(index))
            index = left_child_index(index)
          else
            swap_with_parent(right_child_index(index))
            index = right_child_index(index)
          end
        else
          swap_with_parent(left_child_index(index))
          index = left_child_index(index)
        end
      end
    end

    def right_child(index)
      fetch(right_child_index(index))
    end

    def right_child_index(index)
      (index * 2) + 2
    end

    def left_child(index)
      fetch(left_child_index(index))
    end

    def left_child_index(index)
      (index * 2) + 1
    end

    def in_wrong_order_with_children?(index)
      parent = fetch(index)
      (has_left_child_at?(index) && ((parent <=> left_child(index)) / @ordering < 0)) ||
        (has_right_child_at?(index) && ((parent <=> right_child(index)) / @ordering < 0))
    end

    def has_two_children_at?(index)
      has_left_child_at?(index) && has_right_child_at?(index)
    end

    def has_left_child_at?(index)
      not self[left_child_index(index)].nil?
    end

    def has_right_child_at?(index)
      not self[right_child_index(index)].nil?
    end

    def has_parent_at?(index)
      parent_index(index) >= 0
    end

    def parent_of(index)
      fetch(parent_index(index))
    end

    def swap_with_parent(index)
      child = fetch(index)
      self[index] = fetch(parent_index(index))
      self[parent_index(index)] = child
      nil
    end

    def in_wrong_order_with_parent?(child, parent)
      comparison = child <=> parent
      comparison / @ordering > 0
    end

    def parent_index(index)
      (index - 1) / 2
    end
  end
end
