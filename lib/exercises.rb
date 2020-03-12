

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n*m) n is the length of input array and m is the length of each word
# Space Complexity: O(n)

def grouped_anagrams(strings)
  result = {}
  strings.each do |word|
    letter_occurrence = {}
    word.each_char do |char|
      if letter_occurrence[char] 
        letter_occurrence[char] += 1
      else
        letter_occurrence[char] = 1
      end
    end
    
    if result[letter_occurrence]
      result[letter_occurrence] << word
    else
      result[letter_occurrence] = [word]
    end
  end
  return result.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(nlogn) where n is the number of unique elements in list as we have to sort the element_occurrence hash
# Space Complexity: O(n) where n is the number of unique elements in list 
def top_k_frequent_elements(list, k)
  element_occurrence = {}
  list.each do |element|
    if element_occurrence[element]
      element_occurrence[element] += 1
    else
      element_occurrence[element] = 1
    end
  end
  
  sorted_pairs = element_occurrence.sort_by {|key, value| -value }
  output = []
  k.times do |index|
    return output if sorted_pairs[index].nil?
    output << sorted_pairs[index].first
  end
  return output
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