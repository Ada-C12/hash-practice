

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n) * O(m log m)  where n = strings[] size and m = length of each word therein.
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
# Time Complexity: O(n log n) where n = size of list and also n = number of keys in inventory{}
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
### BUT... just because we can prove that a table is NOT valid based on initial presentation, doesn't mean that the puzzle is actually solve-able, does it?
### It's like, ok here we are testing to see if this baby is stillborn, but just because it's healthy now doesn't mean that I can guarantee that it's going to grow to natural old age because seomthing might go wrong later?
### IDK enough math theory to know if NOT being a true negative now will automatically mean a true positive later.
# Time Complexity: O(n), need to look at every single value
# Space Complexity: O(1), I start everyone out with the same inventory{}
def valid_sudoku(table)
  # check each row
  table.each do |row|
    return false if !validRow?(row)
  end
  
  # check each column
  9.times do |column_index|
    return false if !validColumn?(table, column_index)
  end
  
  # check each 3x3 sub-box
  leftUpperXYIndexPairs = [
    [0, 0],
    [0, 3],
    [0, 6],
    [3, 0],
    [3, 3],
    [3, 6],
    [6, 0],
    [6, 3],
    [6, 6]
  ]
  leftUpperXYIndexPairs.each do |leftUpperindices|
    return false if !validSubbox?(table, leftUpperindices[0], leftUpperindices[1])
  end
  
  # entire table is valid if haven't failed by now
  return true
end

def validRow?(row)
  inventory = {'1'=>0, '2'=>0, '3'=>0, '4'=>0, '5'=>0, '6'=>0, '7'=>0, '8'=>0, '9'=>0, '.'=>-10}
  
  row.each do |number|
    if inventory[number] > 0
      return false
    else
      inventory[number] += 1
    end
  end
  
  return true
end

def validColumn?(table, column_index)
  inventory = {'1'=>0, '2'=>0, '3'=>0, '4'=>0, '5'=>0, '6'=>0, '7'=>0, '8'=>0, '9'=>0, '.'=>-10}
  
  table.each do |row|
    number = row[column_index]
    if inventory[number] > 0
      return false 
    else  
      inventory[number] += 1
    end
  end
  
  return true
end

def validSubbox?(table, leftUpperRowIndex, leftUpperColIndex)
  inventory = {'1'=>0, '2'=>0, '3'=>0, '4'=>0, '5'=>0, '6'=>0, '7'=>0, '8'=>0, '9'=>0, '.'=>-10}
  
  3.times do |rowCount|
    3.times do |columnCount|
      number = table[leftUpperRowIndex + rowCount][leftUpperColIndex + columnCount]
      
      if inventory[number] > 0
        return false 
      else
        inventory[number] += 1
      end
    end
  end
  
  return true
end