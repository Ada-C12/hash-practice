

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n) + O(m log m)  where n = strings[] size and m = length of each word therein.
# Space Complexity: O(n) 

def grouped_anagrams(strings)
  
  inventory = {}
  # key = alphabetically sorted word
  # value = array of original word(s), where each can be sorted into the key.
  # example: "bat" from strings[] would show up in inventory as "abt" => ["bat"]
  # and later if "tab" is found in strings[], inventory would now include "abt" => ["bat", "tab"]
  
  strings.each do |word|
    # source for line below: https://solidfoundationwebdev.com/blog/posts/how-to-sort-a-string-alphabetically-in-ruby
    sortedWord = word.chars.sort_by(&:downcase).join
    
    if inventory[sortedWord]
      inventory[sortedWord] << word 
    else
      inventory[sortedWord] = [word]
    end
  end
  
  output = []
  inventory.each do |key, value|
    output << value
  end
  
  return output
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n) + O(m log m) where n = size of list and m = number of keys in inventory{}
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  return [] if list == []
  
  inventory = {}
  # take inventory of list, where key = element and value = #_of_occurrences
  list.each do |element|
    if inventory[element]
      inventory[element] += 1
    else
      inventory[element] = 1
    end
  end
  
  # sort the hash values and return as a 2D array
    # weirdness, if I sorted by value to get the asc_order, then the order of appearance in orig list will be backwards :=(
    # but if I sort by -value, then order of appearance is preserved and tests will pass
  key_value_arrays_in_desc_order = inventory.sort_by { |key, value| -value }
  p key_value_arrays_in_desc_order
  
  answer = []
  index = 0
  until index == k
    answer << key_value_arrays_in_desc_order[index][0]
    index += 1
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