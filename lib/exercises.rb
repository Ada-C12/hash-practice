
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n * m) as for each word in the list I'm iterating over the letters.
# # Space Complexity: O(n).

def grouped_anagrams(list_strings)
  anagrams = Hash.new()  

  list_strings.each do |s| 
    key = s.downcase.chars.sort.join          

    if !anagrams.has_key?(key)
      anagrams[key] = [s]
    else
      anagrams[key].push(s)
    end
  end

  result = Array.new() 
  anagrams.each do |k,v| 
    result.push(v)
  end

  return result
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(kn)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)  
  repetitions = Hash.new 

  list.each do |n| 
    if !repetitions.has_key?(n) 
      repetitions[n] = 1     
    else 
      repetitions[n] += 1
    end
  end

  result = []        
  while k != 0       
    max = repetitions.values.max  

    list.each do |n|  
      if repetitions.has_key?(n) && repetitions[n] == max    
        result.push(n)         
        repetitions.delete(n)   
        break
      end
    end
    k -= 1
  end
  return result
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