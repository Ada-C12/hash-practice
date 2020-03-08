# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n^2)
strings = ["eat", "tea", "tan", "ate", "nat", "bat"]
def grouped_anagrams(strings)
  hash = {}
  # seperate words, alphabetizes them, and puts them in a hash
  strings.each do |word|
    letters = word.split('').sort().join()
    hash[letters] = [] if hash[letters].nil?
    hash[letters] << word
  end
  
  # sorts through has by the key and pushes to array
  anagrams = []
  hash.keys.each do |key|
    anagrams << hash[key]
  end
  return anagrams
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n^2)
def top_k_frequent_elements(list, k)
  return [] if list == []
  hash = Hash.new(0)
  counter = 0;
  list.each do |value|
    hash[value] = [] if hash[value].nil?
    hash[value]+=1
  end
  
  if k > hash.size()
    raise ArgumentError, "Not Enough Values to Display"
  end
  
  solution = hash.max(k){ |a, b| b<=>a} 
  p solution
  numbers = []
  solution.each do |array|
    numbers << array[0]
  end
  return numbers
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