

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n * m) where n is the number of characters in the longest word and m is the size of the input array
# Space Complexity: O(n) where n is the size of the input array

def grouped_anagrams(strings)
  return [] if strings.empty?
  hash = {}
  
  strings.each do |string|
    alphebetized = string.chars.sort.join
    if hash[alphebetized]
      hash[alphebetized] << string
    else
      hash[alphebetized] = [string]
    end
  end
  
  return hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n) where n is the size of the array
# Space Complexity: O(n) where n is the size of the array
def top_k_frequent_elements(list, k)
  return [] if list.empty?
  hash = {}
  
  list.each do |element|
    if hash[element]
      hash[element] += 1
    else
      hash[element] = 1
    end
  end
  
  result = hash.keys.sort_by {|key, value| hash[key] <=> hash[value]}
  result = result[0...k]
  return result
  
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