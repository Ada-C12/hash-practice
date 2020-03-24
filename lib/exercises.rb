# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  word_hash = {}

  strings.each do |word|
    char_hash = {}

    word.each_char do |char|
      if char_hash[char] 
        char_hash[char] += 1
      else
        char_hash[char] = 1
      end
    end

    if word_hash[char_hash]
      word_hash[char_hash] << word
    else
      word_hash[char_hash] = [word]
    end
  end

  return word_hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)
  result_arr = []
  return result_arr if list.length == 0

  frequency_hash = {}

  list.each do |element|
    if frequency_hash[element]
      frequency_hash[element] += 1
    else
      frequency_hash[element] = 1
    end
  end

  k.times do
    top_element = nil
    top_frequency = 0 

    frequency_hash.each do |element, frequency|
      top_frequency = frequency  && top_element = element if frequency > top_frequency
    end

    result_arr << top_element
    frequency_hash[top_element] = 0
  end

  return result_arr
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