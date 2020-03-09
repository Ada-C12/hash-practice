

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n^2)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  hash = {}
  acc = 0
  return_array = []
  strings.each do |str|
    if !(hash[str.split(//).sort!.join().hash])
      hash[str.split(//).sort!.join().hash] = acc
      return_array[acc] = [str]
      acc += 1
    else
      return_array[hash[str.split(//).sort!.join().hash]] << str
    end
  end
  return return_array
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)
  # load a hash table which has elements & their frequency 
  element_frequency = {}
  array = []
  return array if list.length == 0

  list.each do |val|
    if !(element_frequency[val])
      element_frequency[val] = 1
    else
      element_frequency[val] += 1
    end
  end

  values = element_frequency.values.sort!
  inverted_hash = element_frequency.invert
  
  k.times do |i|
    array << inverted_hash[values[i]]
  end

  return array 
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