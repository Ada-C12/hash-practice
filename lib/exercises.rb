

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: ?
# Space Complexity: ?

def grouped_anagrams(strings)
  # create a hash table of letter frequencies for each word: 'eat' => [{'e': 1, 'a': 1 't': 1}]
  # compare first hash table to other hash tables: if any other tables have the same frequencies, the words associated with the original table and matching tables go into an array
  # remove matches from array of hashes
  # continue working through hash tables until all tables have been compared
  # if hash table doesn't have a match, the associated word will be the only element in its array
  # time complexity: O(n) where n is the total number of letters in array to create the hash maps, then O(m) where m is the number of words to do the comparisons
  
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