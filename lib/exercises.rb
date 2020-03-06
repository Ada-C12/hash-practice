

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n) where n is the number of strings
# Space Complexity: O(n) where n is the number of strings
def grouped_anagrams(strings)
  length = strings.length
  # kind of arbitrary but it seems big enough to get a good spread?
  upper_bound = length * 3
  hash = Array.new(upper_bound)

  strings.each do |string|
    hashed_index = get_hashed_index(string, upper_bound)
    if hash[hashed_index].nil?
      hash[hashed_index] = [string]
    else
      hash[hashed_index].push(string)
    end
  end

  return get_clean_hash(hash)
end

def get_hashed_index(string, upper_bound)
  return string.bytes.sum % upper_bound
end

def get_clean_hash(hash)
  clean = []
  hash.each do |item|
    if !item.nil?
      clean << item
    end
  end
  return clean
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