

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  results = []
  return results if strings.empty?

  hash_map = {}
  set_no = 1  

  strings.each do |word|
    letters = word.split('').sort!

    if hash_map.empty?
      hash_map[set_no] = letters
      set_no += 1
    elsif !hash_map.has_value?(letters)
      hash_map[set_no] = letters
      set_no += 1
    end 
  end 

  results = []

  hash_map.keys.each do |sub_arr|
    sub_arr = []
    results << sub_arr
  end 

  strings.each do |word|
    letters = word.split('').sort!

    if hash_map.has_value?(letters)
      sub_group = hash_map.key(letters)
      results[sub_group-1] << word
    end 
  end 

  results.each do |list|
    list.sort!
  end 
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  results = []

  return list if list.length == k
  return results if list.length == 0 

  list = list.sort.uniq

  i = 0
  k.times do 
    results << list[i]
    i += 1
  end 
  return results
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