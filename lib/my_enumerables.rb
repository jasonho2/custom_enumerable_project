module Enumerable
  # Your code goes here
  # each_with_index
  def my_each_with_index
    i = 0
    self.my_each do |elem|
      yield(elem, i)
      i += 1
    end
    self
  end

  # select
  def my_select
    result = []
    self.my_each do |elem|
      result << elem if yield(elem)
    end
    result
  end

  # all?
  def my_all?
    result = []
    self.my_each do |elem|
      result << elem if yield(elem)
    end
    result == self
  end

  # any?
  def my_any?
    result = []
    self.my_each do |elem|
      result << elem if yield(elem)
    end
    result.length > 0
  end

  def my_none?
    result = []
    self.my_each do |elem|
      result << elem if yield(elem)
    end
    result.length == 0
  end

  def my_count(item = nil)
    count = 0
    if item
      self.my_each { |element| count += 1 if element == item }
    elsif block_given?
      self.my_each { |element| count += 1 if yield(element) }
    else
      count = self.size
    end
    count
  end

  def my_map
    result = []
    self.my_each { |elem| result << yield(elem) }
    result
  end

  def my_inject(initial = nil)
    accumulator = initial.nil? ? self.first : initial
    self.my_each do |elem|
      accumulator = yield(accumulator, elem)
    end
    accumulator
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for elem in self
      yield(elem)
    end
    self
  end
end
