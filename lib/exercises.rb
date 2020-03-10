

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  return [] if strings.empty?
  anagram_hash = {}
  
  strings.each do |word|
    letters = word.split("").sort.join("")
    if anagram_hash[letters].nil?
      anagram_hash[letters] = [word]
    else
      anagram_hash[letters] << word
    end
  end
  return anagram_hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  counter_hash = {}
  list.each do |value|
    if counter_hash[value].nil?
      counter_hash[value] = 1
    else
      counter_hash[value] += 1
    end
  end 
  
  values_sort =  counter_hash.sort_by {|key, value| -value}
  k_values = values_sort.slice(0..(k-1))
  final_values = []
  k_values.each do |value|
    final_values << value[0]
  end
  
  return final_values
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