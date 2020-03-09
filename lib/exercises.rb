

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: o(n)
# Space Complexity: o(n)

def grouped_anagrams(strings)
  # raise NotImplementedError, "Method hasn't been implemented yet!"
  hash = {}

  strings.each do |word|
    key = word.chars.sort.join

    if hash[key]
      hash[key] << word
    else
      hash[key] = [word]
    end
  end

  return hash.values
end


# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: o(n)
# Space Complexity: o(n)
def top_k_frequent_elements(list, k)
  # raise NotImplementedError, "Method hasn't been implemented yet!"
  hash = {}
  result = []

  return result if list.empty?

  list.each do |num|
    if hash[num]
      hash[num] += 1
    else
      hash[num] = 1
    end
  end

  k.times do
    max = hash.key(hash.values.max)
    result << max
    hash.delete(max)
  end

  return result
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