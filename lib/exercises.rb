# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n) + sort
# Space Complexity: O(n)
def grouped_anagrams(strings) 
  hash = {}
  
  strings.each do |string|   
    # to avoid collision
    key = string.chars.sort.join
    
    if hash[key].nil?
      hash[key] = [string]
    else
      hash[key] << string
    end 
  end 
  
  return hash.values
end

##pp grouped_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"])

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  hash = {}
  result = []
  
  return result if list.empty?
  
  list.each do |num|
    if hash[num].nil?
      hash[num] = 1
    else
      hash[num] += 1
    end
  end 
  
  k.times do
    max = nil
    
    hash.each do |num,v|  
      if v && (max.nil? || v > max)
        max = num
      end
    end 
    
    if max 
      hash[max] = nil
      result << max
    end
  end 
  return result
end 

##pp top_k_frequent_elements([1,1,1,2,2,3], 2)

# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: ?
# Space Complexity: ?

# Check alices solution
# def valid_sudoku(table)
#   raise NotImplementedError, "Method hasn't been implemented yet!"
# end
