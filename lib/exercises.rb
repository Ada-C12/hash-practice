

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  anagram_hash = Hash.new

  strings.each do |word|
    sorted_string = word.chars.sort.join

    #Check if key exists with the sorted string already
    #In case of yes, add the word to the array value of the key  
    if anagram_hash[sorted_string]
      anagram_hash[sorted_string] += [word] 

    #If not, set it as a new key/value pair in the hash
    else 
      anagram_hash[sorted_string] = [word]
    end 
  end 
  return anagram_hash.valuesend

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  result = []

  hash = Hash.new
  
  list.each do |letter|
    if hash[letter]
      hash[letter] += 1
    else 
      hash[letter] = 1
    end 
  end 

  k.times do 
    max = nil
    hash.each do |num, value|

      if value && (max.nil? || value > max)
        max = num 
      end 
    end 

    if max 
      hash[max] = nil 
      result << max 
    end 
  end 
  return result end


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