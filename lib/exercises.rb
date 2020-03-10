

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n log n) ?? because of the word sort section
# Space Complexity: O(n) where n is the length of the string array

def grouped_anagrams(strings)
  hash = {} # S: O(n) where n is length of string
  
  if strings.length == 0
    return []
  else
    strings.each do |word| # T: O(n) where n is length of strings
      word_in_alpha = word.chars.sort.join # T: O(log n) ??
      
      if hash.key?(word_in_alpha) # T: O(1)
        hash[word_in_alpha] << word
      else
        hash[word_in_alpha] = [word] 
      end
    end
    
    print_hash = [] # S: O(n) where n is length of string
    
    hash.each do |key, value| # T: O(n) where n is length of hash
      print_hash << value
    end
    
    return print_hash
  end
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n log n) ?? because of the hash sort_by section
# Space Complexity: O(n) where n is the length of list
def top_k_frequent_elements(list, k)
  if list.length == 0
    return []
  end
  
  hash = {} # S: O(n) where n is length of list
  
  list.each do |num| # T: O(n) where n is length of list
    if hash.key?(num) 
      hash[num] += 1
    else
      hash[num] = 1
    end
  end
  
  ordered_hash = hash.sort_by {|k, v| -v} # T: O(log n) ?
  
  k_list = [] # S: O(1) can only be as big as k no matter the size of list
  
  k.times do |i| # T: O(1)
    k_list << ordered_hash[i][0]
  end
  
  return k_list
end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: ?
# Space Complexity: ?
def valid_sudoku(table)
  table.each do |row|
    row.each do |value|
      hash = {}
      if value != "."
        if hash.key?(value)
          return false
        else
          hash[value] = 1
        end
      end
    end
  end
  
  counter = 0
  until counter > 8
    hash = {}
    table.each do |row|
      if row[counter] != "."
        if hash.key?(row[counter])
          return false
        else
          hash[row[counter]] = 1
        end
      end
    end
    counter += 1
  end
  
  
  # still need to complete the sub box check here
  
  return true
end