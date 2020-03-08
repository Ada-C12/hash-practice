

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(w * n^2) ?
# THINKING....
# Iterating through the string = O(n), summing each word = O(w); O(n * w)
# checking for the word's sum in the hash and shovel onto array = O(1)
# returning the hash values = O(n) b/c if no words are anagrams, our hash would be the
# same size as the original array.

# Space Complexity: O(n); The hash ends up being the same size as the string/input size.

def grouped_anagrams(strings)
  return strings if strings.empty?
  
  anagrams = {}
  # for each word, if the sum is in the hash
  strings.each do |word|
    if anagrams[word.sum].nil?
      anagrams[word.sum] = [word]
    else
      anagrams[word.sum] << word
    end
  end
  
  return anagrams.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n + k)
# Iterate through each element in order to count and add to hash O(n)
# Sort the hash: maybe O(log n)
# Put return first k elements = O(k)

# Space Complexity: O(n); worst case, hash is same size as array. Other variables are O(1).
def top_k_frequent_elements(list, k)
  return [] if list.empty?
  
  element_count = {}
  
  list.each do |element|
    if element_count[element].nil?
      element_count[element] = 1
    else
      element_count[element] += 1
    end
  end
  
  sorted_elements = element_count.sort_by(&:first)
  
  i = 0
  max_nums = []
  k.times do
    max_nums << sorted_elements[i][0]
    i += 1
  end
  
  return max_nums
end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: ?
# Space Complexity: ?
def valid_sudoku(table)
  
end
