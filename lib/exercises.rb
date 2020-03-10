

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n) where n is the number of strings for the hashing function but I'm not sure how split/sort/join factors in (maybe O of m where m is the number of letters in all the strings?). 
# Space Complexity: O(n) because we are creating a new place in memory for each string

def grouped_anagrams(strings)

  hash = {}

  # take each word in 'strings' array ...
  strings.each do |word|
    # ... and split it into letters, alphabetize those letters, and join them back together: this produces a standardized string for words that are anagrams of each other ('ate', 'eat' => 'aet')
    letters = word.split(//).sort().join()
    
    # if the standardized string isn't already in the hash, add it as the key and an empty array as the value
    if hash[letters].nil?
      hash[letters] = []
    end

    # push the word to the array for the associated standardized string
    hash[letters] << word

  end

  # return the values (array of words with matching letters) for each standardized string
  return hash.values

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

