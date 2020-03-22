# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n) + sort
# Space Complexity: O(n)
def grouped_anagrams(strings) 
  hash = {}
  
  strings.each do |string|   
    # to avoid collision
    key = string.chars.sort.join
    
    if hash[key].nil?
      hash[key] = [string]
    else
      hash[key] << string
    end 
  end 
  
  return hash.values
end

##pp grouped_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"])

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  hash = {}
  result = []
  
  return result if list.empty?
  
  list.each do |num|
    if hash[num].nil?
      hash[num] = 1
    else
      hash[num] += 1
    end
  end 
  
  k.times do
    max = nil
    
    hash.each do |num,v|  
      if v && (max.nil? || v > max)
        max = num
      end
    end 
    
    if max 
      hash[max] = nil
      result << max
    end
  end 
  return result
end 

##pp top_k_frequent_elements([1,1,1,2,2,3], 2)

# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: O(1) if fixed number of squares
# Space Complexity: O(1) if fixed number of squars
require 'set'

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
      y += 1
    end 
    y = 0
    x += 1
  end
  return true
end 

# pp valid_sudoku([
#   ["8","3",".",".","7",".",".",".","."],
#   ["6",".",".","1","9","5",".",".","."],
#   [".","9","8",".",".",".",".","6","."],
#   ["8",".",".",".","6",".",".",".","3"],
#   ["4",".",".","8",".","3",".",".","1"],
#   ["7",".",".",".","2",".",".",".","6"],
#   [".","6",".",".",".",".","2","8","."],
#   [".",".",".","4","1","9",".",".","5"],
#   [".",".",".",".","8",".",".","7","9"]
#   ])
