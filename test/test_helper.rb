require 'test/unit'

class SameCounter
  include Comparable
  attr_accessor :count

  def initialize
    @count = 0
  end

  def <=>(other)
    @count += 1
    other.count += 1
    0
  end
end

class LessCounter
  include Comparable
  attr_accessor :count

  def initialize
    @count = 0
  end

  def <=>(other)
    @count += 1
    -1
  end
end

class GreaterCounter
  include Comparable
  attr_accessor :count

  def initialize
    @count = 0
  end

  def <=>(other)
    @count += 1
    other.count += 1
    1
  end
end
