

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n*m) (looping through arrays and word length)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  final_arrays = {}
  
  strings.each do |string|
    letters_count = {}
    string.each_char do |char|
      if letters_count[char]
        letters_count[char] += 1
      else
        letters_count[char] = 1
      end
    end
    
    if final_arrays[letters_count]
      final_arrays[letters_count] << string
    else
      final_arrays[letters_count] = [string]
    end
  end
  
  output = []
  final_arrays.each do |k, v| 
    output << v
  end
  return output
  
end


# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)
  counter_hash = {}
  final_elements = []
  list.each do |element|
    if counter_hash[element]
      counter_hash[element] += 1
    else
      counter_hash[element] = 1
    end
  end
  
  new_elements = []
  
  k.times do |element|
    max = counter_hash.key(counter_hash.values.max)
    new_elements << max
    hash.delete(max)
  end
  return new_elements
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