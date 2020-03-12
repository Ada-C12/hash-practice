

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  if strings.length == 0 #empty hash if no char in string
    return []
  end
  
  anagrams_hash = {} #where its a-going to get put
  
  anagram_array = []
  
  strings.each do |word| #take each word...
    letters = word.split("").sort.join("") #...split into letters, and rejoin them
    if anagrams_hash[letters].nil? #if string isnt in hash
      anagrams_hash[letters] = word
    else 
      anagrams_hash[letters] = [word]
    end
    
    anagram_array.push(word) #shovels word in
    
    return anagrams_hash.values #boom boom
    
  end
  
  # This method will return the k most common elements
  # in the case of a tie it will select the first occuring element.
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def top_k_frequent_elements(list, k)
    return [] if list.empty? #empty array if no char in list
  end
  
  common_elements_hash = {} #where its going...
  
  list.each do |element|
    if common_elements_hash[element].nil? #if empty, start at one
      common_elements_hash[element] = 1 
    else
      common_elements_hash[element] += 1 #otherwise increment
    end
  end
  
  elements_sort = common_elements_hash.max_by(k) {|key, value| value} #gives us k hash pairs in array form
  elements_keys = []
  
  elements_sort.each do |array| 
    if k == 1 
      elements_keys << common_elements_hash.min[0]
    else
      elements_keys << array[0]
    end
  end
  return elements_keys
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