module Enumerable
  def my_each_with_index
    index = 0
    elements = []
    for element in self
      temp = yield(element,index)
      if temp
        elements << temp
      else
        return self
      end
      index += 1
    end
    elements
  end
  def my_select
    matching_elements = []
    for element in self
      result = yield(element)
      if result
        matching_elements << element
      end
    end
    matching_elements
  end
  def my_all?
    for element in self
      result = yield(element)
      if not result
        return false
      end
    end
    return true
  end
  def my_any?
    for element in self
      result = yield(element)
      if result
        return true
      end
    end
    return false
  end
  def my_none?
    for element in self
      result = yield(element)
      if result
        return false
      end
    end
    return true
  end
  def my_count
    if not block_given?
      return self.size
    end
    count = 0
    for element in self
      result = yield(element)
      if result
        count += 1
      end
    end
    count
  end
  def my_map
    elements = []
    for element in self
      elements << yield(element)
    end
    elements
  end
  def my_inject(initial_value = 0)
    reduction = initial_value
    for element in self
      reduction = yield(reduction,element)
    end
    reduction
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    elements = []
    for element in self
      temp_element = yield(element)
      if temp_element
        elements << temp_element
      else
        return self
      end
    end
    elements
  end
end
