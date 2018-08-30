require "byebug"

def bubble_sort(array)
  i = array.length
  
  sorted = false
  
  until sorted
    sorted = true
    (0..i - 1).each do |idx|
      j = idx + 1
      (j...i).each do |jdx|
        if array[idx] > array[jdx]
          array[idx], array[jdx] = array[jdx], array[idx]
          sorted = false
        end
      end
    end
  end
  
  array.first
  
end

def min_phase2(array)
  array.reduce do |acc, el2|
    if el2 < acc
      el2
    else
      acc
    end
  end
end

def lcss(array)
  result = []
  
  array.each_with_index do |el1, idx|
    result << [el1]
    temp_arr = [el1]
    array[idx+1..-1].each do |el2|
      temp_arr += [el2]
      result << temp_arr
    end
  end
  
  result.reduce do |acc, subarr|
    if acc.reduce(:+) < subarr.reduce(:+)
      subarr
    else
      acc
    end
  end

end

def lcss_phase2(array)
  return array.max if array.all? {|el| el < 0}
  highest_sum = 0
  current_sum = 0
  array[0...-1].each_with_index do |current_el, idx|
    current_sum += current_el
    if current_sum < 0
      current_sum = 0
    elsif (current_sum + array[idx + 1]) > highest_sum
      highest_sum = current_sum + array[idx + 1]
    end
  end
  highest_sum
end
    
    
    
