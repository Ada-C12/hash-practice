

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: Worst case runtime is O(nlogn). O(n) if words are small enough
# Space Complexity: O(n)

def grouped_anagrams(strings)
  return [] if strings.empty?

  result = {}
  groups = []

  strings.each do |word|
    key = word.split("").sort.join
    if result.has_key?(key)
      result[key] << word
    else
      result[key] = [word]
    end
  end

  result.each do |k, v|
    groups << v
  end

  return groups
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  return [] if list.empty?

  frequency_count = Hash.new(0)
  list.each do |num|
    frequency_count[num] += 1
  end

  top_k = frequency_count.to_a.sort_by { |e| e[1] }

  if k == 1
    top_k.first(k).map { |e| e[0] }
  else
    top_k.last(k).map { |e| e[0] }
  end
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
