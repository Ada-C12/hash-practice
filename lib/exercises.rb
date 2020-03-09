

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n*m)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  return [] if strings.empty?
  hash = {}

  strings.each do |string|
    alphabetized = string.chars.sort.join

    if hash[alphabetized]
      hash[alphabetized] << string
    else
      hash[alphabetized] = [string]
    end
  end
  return hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)
  return [] if list.empty?
  elements = []
  hash = {}

  list.each do |elem|
    if hash[elem]
      hash[elem] += 1
    else
      hash[elem] = 1
    end
  end

  k.times do
    max_key = hash.key(hash.values.max)
    elements << max_key
    hash = hash.delete(max_key)
  end
  return elements

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