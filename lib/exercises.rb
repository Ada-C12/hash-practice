

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(m * n), where m is the number of words in the strings array and n is the (worst case?) length of the words
# Space Complexity: O(m), could have been O(m + n) but n is at most 26 or 52

def grouped_anagrams(strings)
  return [] if strings.length == 0
  
  anagram_hash = {}
  
  strings.each do |word|
    letters_hash = {}
    
    word.each_char do |char|
      if letters_hash[char]
        letters_hash[char] += 1
      else
        letters_hash[char] = 1
      end
    end
    
    if anagram_hash[letters_hash]
      anagram_hash[letters_hash] << word
    else
      anagram_hash[letters_hash] = [word]
    end
  end
  
  return anagram_hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n^2), where n is the number of numbers in list (worst case scenario)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  return [] if list.length == 0 || k == 0
  
  nums_hash = {}
  distinct_numbers = 0
  
  list.each do |num|
    if nums_hash[num]
      nums_hash[num] += 1
    else
      nums_hash[num] = 1
      distinct_numbers += 1
    end
  end
  
  # I'm going to assume that we don't need to return the array in order of the most to least frequent
  return nums_hash.keys if distinct_numbers <= k 
  
  result = []
  
  k.times do
    max_value = nil
    max_frequency = 0
    
    nums_hash.each do |num, freq|
      if freq > max_frequency
        max_value = num
        max_frequency = freq
      end
    end
    
    result << max_value
    nums_hash[max_value] = 0
  end
  
  return result
end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: O(1), table must be 9x9
# Space Complexity: O(1), table must be 9x9
def valid_sudoku(table)
  # assume that the input must always be 9x9 table
  subgrid_hash = {}
  
  9.times do |i|
    rows_hash = {}
    columns_hash = {}
    
    9.times do |j|
      row_value = table[i][j]
      column_value = table[j][i]
      
      if row_value != "."
        return false if rows_hash[row_value]
        rows_hash[row_value] = 1
        
        # we could have checked subgrid using either row or column values
        # doesn't matter as long as we're consistent
        # subgrid is indexed as an array of i/3 and j/3 values or [i/3, j/3]
        
        # does your subgrid currently exist
        if subgrid_hash[[i/3, j/3]]
          return false if subgrid_hash[[i/3, j/3]][row_value]
          subgrid_hash[[i/3, j/3]][row_value] = 1
        else
          # if your subgrid does not exist, create it
          subgrid_hash[[i/3, j/3]]= {}
          # then place the actual 1-9 value inside and set the frequency as 1
          subgrid_hash[[i/3, j/3]][row_value] = 1
        end
      end
      
      if column_value != "."
        return false if columns_hash[column_value]
        columns_hash[column_value] = 1
      end
    end
  end
  
  return true
end
