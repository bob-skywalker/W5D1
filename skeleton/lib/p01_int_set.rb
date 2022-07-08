class MaxIntSet
  attr_reader :set, :store
  def initialize(max)
    @max = max 
    @set = Array.new
    @store = Hash.new(false)
  end

  def insert(num)
    if num < 0 || num > @max 
      raise "Out of bounds"
    end 
    set << num
    store[num] = true 
    return true 
  end

  def remove(num)
    set.delete(num)
    store[num] = false 
  end

  def include?(num)
    set.include?(num)
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store, :set
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @set = []
  end

  def insert(num)
    i = num 
  end 
  #   store.each do |arr|
  #     if arr.empty? 
  #       arr << num
  #       break
  #     end 
  #   end 
  #   store
  # end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
