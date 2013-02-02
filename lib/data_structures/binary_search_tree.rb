module DataStructures
  class BinarySearchTree
    attr_reader :root

    def insert(element)
      if has_root?
        root.insert(element)
      else
        @root = DataStructures::BinarySearchTree::Node.new(element)
        true
      end
    end

    def remove(element)
      if has_root?
        @root = root.remove(element)
      else
        false
      end
    end

    def get(element)
      if has_root?
        node = root
        until(node.element == element)
          case(node.element <=> element)
          when Node::LESS_THAN_OTHER
            if node.has_left_child?
              node = node.left_child
            end
          when Node::GREATER_THAN_OTHER
            if node.has_right_child?
              node = node.right_child
            end
          end
        end
        node.element
      else
        nil
      end
    end

    def size
      in_order.size
    end

    def in_order
      if has_root?
        stack = Array.new
        node = root
        in_order_array = []
        in_order_array += node.left_ancestors.map(&:element)

        while(not stack.empty?)
          node = stack.pop
          in_order_array.push(node.element)
          if node.has_right_child?
            stack.push(node.right_child)
            node = node.right_child
            node.left_ancestors.each do |node|
              stack.push(node)
            end
          end
        end

        in_order_array
      else
        []
      end
    end

    private

    def has_root?
      not root.nil?
    end

    class Node
      LESS_THAN_OTHER = -1
      GREATER_THAN_OTHER = 1
      attr_accessor :left_child, :right_child, :element

      def initialize(element)
        @element = element
      end

      def insert(element)
        case @element <=> element
        when LESS_THAN_OTHER
          if has_left_child?
            left_child.insert(element)
          else
            @left_child = DataStructures::BinarySearchTree::Node.new(element)
            return true
          end
        when GREATER_THAN_OTHER
          if has_right_child?
            right_child.insert(element)
          else
            @right_child = DataStructures::BinarySearchTree::Node.new(element)
            return true
          end
        else
          return false
        end
      end

      def remove(element)
        case @element <=> element
        when LESS_THAN_OTHER
          if has_left_child?
            @left_child = left_child.remove(element)
          else
            nil
          end
        when GREATER_THAN_OTHER
          if has_right_child?
            @right_child = right_child.remove(element)
          else
            nil
          end
        else
          if has_two_children?
            node = left_child
            while(node.has_right_child?)
              node = node.right_child
            end
            @left_child = left_child.remove(node.element)


          elsif has_left_child?
            left_child
          elsif has_right_child?
            right_child
          else
            nil
          end
        end
      end

      def has_two_children?
        has_left_child? and has_right_child?
      end

      def left_ancestors
        left_ancestors = []
        node = self
        until node.nil?
          left_ancestors << node
          node = node.left_child
        end
        left_ancestors
      end

      def has_left_child?
        not left_child.nil?
      end

      def has_right_child?
        not right_child.nil?
      end
    end
  end
end
