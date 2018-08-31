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

# O(n!*n)
def anagram?(str, str2)
  perms = str.chars.permutation.map &:join
  perms.include?(str2)
end

# O3n)
def second_anagram?(str1, str2)
  arr1 = str1.split("")
  arr2 = str2.split("")
  arr1.each do |ch|
    if arr2.include?(ch)
      idx2 = arr2.find_index(ch)
    else
      return false
    end
    arr2.delete_at(idx2)
  end
  arr2.empty?
end

# O(n**2)
def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end
  
# O(n)?
def fourth_anagram?(str1, str2)
  one = Hash.new(0)
  two = Hash.new(0)
  str1.each_char do |el|
    one[el] += 1
  end
  str2.each_char do |el2|
    two[el2] += 1
  end
  
  one == two
end  

# O(n)
def bonus_anagram(str1, str2)
  one = Hash.new(0)
  str1.each_char do |el|
    one[el] += 1
  end
  str2.each_char do |el2|
    one[el2] += 1
  end
  
  one.each do |k, v|
    return false unless v % 2 == 0
  end
  true
end


# O(n^2)
def brute_twosum(arr, target)
  i = 0
  while i < arr.length - 1 
    j = i + 1
    while j < arr.length
      return true if arr[i] + arr[j] == target
      j += 1
    end
    i += 1
  end
  false
end

def okay_two_sum?(arr, target)
  until arr[-1]
  arr.sort!
  
  mid = arr.length/2
  left = arr[0...mid]
  right = arr[mid..-1]
  
  
  









