

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n), goes through the length of the string array
# Space Complexity: O(n), size of the output hash depends on the size of the string array

def grouped_anagrams(strings)
  return [] if strings.empty?
  
  output_hash = {}
  
  strings.each do |word|
    letters = {}
    
    word.each_char do |letter|
      if letters[letter].nil?
        letters[letter] = 1
      else
        letters[letter] +=1
      end
    end
    
    if !output_hash[letters].nil?
      output_hash[letters] << word
    else
      output_hash[letters] = [word]
    end
  end
  
  return output_hash.values
  
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n^2)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  return [] if list.empty?
  
  hash = {}
  
  list.each do |num|
    if hash[num].nil?
      hash[num] = 1
    else
      hash[num] +=1
    end
  end
  
  output = []
  
  k.times do |num|
    value = hash.key(hash.values.max)
    
    output << value
    hash.delete(value)
  end
  
  return output
end



# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: O(1), if it is a 9x9
# Space Complexity: O(1), if it is a 9x9
def valid_sudoku(table)
  set = Set.new()
  
  x = 0
  y = 0
  
  while x < 9
    while y < 9
      if table[x][y] != "."
        char = (table[x][y]).to_s
        
        if !set.add?(char + " in row " + x.to_s) ||  
          !set.add?(char + " in column " + y.to_s) || 
          !set.add?(char + " in square " + (x/3).to_s + "," + (y/3).to_s)
          return false
        end
        
      end
      
      y+=1
    end
    y = 0
    x+=1
  end
  return true
  
end