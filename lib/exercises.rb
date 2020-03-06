

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n), assume the length of each word in strings is constant
# Space Complexity: O(n)

def grouped_anagrams(strings)
  res = []
  return res if strings.empty?
  hash = {}
  strings.each do |word|
    key = word.split("").sort.join
    if hash[key]
      hash[key] << word
    else
      hash[key] == [word]
    end
  end
  hash.each do |k, v|
    res << v 
  end
  return res
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(k * n) ~= O(n) if k is small
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  res = []
  return res if list.empty?
  hash = {}
  list.each do |num|
    if hash[num]
      hash[num] += 1
    else
      hash[num] = 1
    end
  end
  
  k.times do 
    max = nil
    hash.each do |num, v|
      if v && (max.nil? || v > max)
        max = num 
      end
    end
    if max
      hash[max] = nil
      res << max
    end
  end

  return res
end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: ?
# Space Complexity: ?
def valid_sudoku(table)
  raise NotImplementedError, "Method hasn't been implemented yet!"
end

def sudoku_helper()