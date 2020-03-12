

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n)

def grouped_anagrams(string_array)
  if string_array.length == 0
    return []
  end
  
  reference_hash = {}
  
  string_array.each do |string|
    
    temp = string_sorter(string)
    
    if reference_hash.keys.include?(temp)
      reference_hash[temp].push(string)
    else
      reference_hash[temp] = ["#{string}"]
    end
  end
  
  return_array = []
  
  reference_hash.each_value do |value|
    return_array.push(value)
  end
  
  return return_array
  
end

def string_sorter(string)
  return_array = []
  string.each_char do |char|
    return_array.push(char)
  end
  return_array.sort!
  return_string = return_array.join
  return return_string
end


# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  if list.length == 0 
    return []
  end
  
  top_frequency = 0
  
  reference_hash = {}
  
  list.each do |string|
    if reference_hash.keys.include?(string)
      reference_hash[string] += 1
    else
      reference_hash[string] = 1
    end
  end
  
  reference_hash.sort_by {|key, value| value}
  temporary_array = reference_hash.keys
  i = 0
  return_array = []
  
  until i == k do
    return_array.push(temporary_array[i])
    i += 1
  end
  
  return return_array
  
end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: ?
# Space Complexity: ?
def valid_sudoku(table)
  
end