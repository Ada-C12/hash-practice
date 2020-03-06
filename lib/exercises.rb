

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n*m) where n is the length of the strings area and m is the length of the string/num of characters
# Space Complexity: O(n) where n is the size of the strings array

def grouped_anagrams(strings)
  return [] if strings.empty?

  #create empty hash
  hash = {}

  #iterate and alphabetize
  strings.each do |word|
    alpha = word.chars.sort.join
    if hash[alpha]
      hash[alpha] << word
    else
      hash[alpha] = [word]
    end
  end

  return hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: 
# Space Complexity: ?
def top_k_frequent_elements(list, k)
  return [] if list.empty?

  answer = []
  hash = {}
  list.each do |num|
    if hash[num]
      hash[num] += 1
    else
      hash[num] = 1
    end
  end

  k.times do
    key = hash.key(hash.values.max)
    answer << key
    hash.delete(key)
  end

  return answer
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