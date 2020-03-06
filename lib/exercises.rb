# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n)
def grouped_anagrams(strings)
  hash = {}

  strings.each do |string|
    sorted_string_array = string.split("").sort

    if hash[sorted_string_array]
      hash[sorted_string_array] << string
    else
      hash[sorted_string_array] = [string]
    end
  end

  answer = []

  hash.each do |key, value|
    answer.push(value)
  end

  return answer
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)
  hash = {}

  list.each do |element|
    if hash[element]
      hash[element] += 1
    else
      hash[element] = 1
    end
  end

  top_hash_elements = hash.max_by(k) { |key, value| value }

  top_elements = top_hash_elements.map { |element| element[0] }

  return top_elements
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