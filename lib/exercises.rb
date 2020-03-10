

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

  # return the values (array of words that are anagrams) for each standardized string
  return hash.values

end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)

  return [] if list.empty?
  
  # create a hash that has each element as key and number of occurrences as value: [1, 1, 1, 2, 2, 3] => {1=>3, 2=>2, 3=>1}
  hash = {}
  list.each do |element|
    if hash[element].nil?
      hash[element] = 1
    else 
      hash[element] += 1
    end
  end
  
  # get the keys associated with k max values. There is almost certainly a better way to do this 
  max_arrays = hash.max_by(k) {|key, value| value}  # this returns k hash pairs as arrays: {1=>3, 2=>2, 3=>1}, k = 2 => [[1, 3], [2, 2]]

  # return the first element from each array
  max_keys = []
  max_arrays.each do |array|
    if k == 1
      # "will work for an array when k is 1 and several elements appear 1 time" situation: return the first key with value of 1 in the element counts hash
      max_keys << hash.min[0]
    else
      max_keys << array[0]
    end
  end

  return max_keys

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

