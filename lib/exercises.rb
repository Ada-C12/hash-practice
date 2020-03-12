

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n2) .sort & .join on each word is its own O(n)?
# Space Complexity: O(n)

def grouped_anagrams(strings)
  result = Hash.new { |h, k| h[k] = [] } #create a new hash w/ value as an empty array

  strings.each do |word|
    if result[word.chars.sort.join]
      result[word.chars.sort.join] << word #check by sorting the words in alphabetical order
    else
      result[word.chars.sort.join] << word
    end
  end
  
  return result.values

end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n) (we're iterating over the given list, and then the hash created)
# Space Complexity: O(n) 
def top_k_frequent_elements(list, k)
  hash = {}

  list.each do |num|
    if hash[num]
      hash[num] += 1
    else
      hash[num] = 1
    end
  end

  # sorting the hash by values in ascending order
  output = hash.select {|k,v| -v}

  return output.keys.first(k) #.keys will return an array, this is a O(1) operation?

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