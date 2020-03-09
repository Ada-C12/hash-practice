

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n) where n is the length of the string array
# Space Complexity: O(n) where n is the length of the string array

def grouped_anagrams(strings)
  hash = {}
  
  if strings.length == 0
    return []
  else
    strings.each do |word|
      word_in_alpha = word.chars.sort.join
      
      if hash.key?(word_in_alpha)
        hash[word_in_alpha] << word
      else
        hash[word_in_alpha] = [word]
      end
    end
    
    print_hash = []
    hash.each do |key, value|
      print_hash << value
    end
    
    return print_hash
  end
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)
  raise NotImplementedError, "Method hasn't been implemented yet!"
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