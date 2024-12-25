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
        elements << element
      end
    end
    elements
  end
end
