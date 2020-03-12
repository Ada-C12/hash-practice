

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: n^2 as for each word in the list I'm iterating over the letters.

# # Space Complexity: O(n) because if none of the words are anagrams, 
# I will duplicate the array. Also, I will create a hash were each key is each word.


def grouped_anagrams(strings)
  alphabet = {}
  words_same_value = {}
  
  index = 0
  anagram_array = []
  value = 0
  
    strings.each do |word|
      word_value = 0

      word.each_char do |letter|  
        if alphabet[letter] == nil
          alphabet[letter] = value + 1
          value += 1
          word_value += alphabet[letter]
        else
          word_value += alphabet[letter]
        end
      end

      if words_same_value[word_value] == nil
        words_same_value[word_value] = [word] 
      else 
        words_same_value[word_value] << word
      end
    end

    words_same_value.keys do |sum|
      anagram_array << sum
    end  

    return anagram_array
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)
  return [] if list.empty?

  repetitions_per_element = {}
  i = 0
  j = 0

  while j < list.length + 1 do 
    if list[i] == list[j]
      j +=1
    else 
      if repetitions_per_element[j-i] == nil
        repetitions_per_element[j-i] = [list[i]]
      else 
        repetitions_per_element[j-i] << list[i]
      end
      i = j
    end
  end

  top_k_elements = []
  repetitions = []

  repetitions_per_element.keys.each do |repetition|
    repetitions << repetition
  end

  repetitions = repetitions.sort

  i = repetitions.length - 1
  
  while k > top_k_elements.length 
      max = repetitions[i]
      repetitions_per_element[max].each do |element|
        if k != top_k_elements.length
          top_k_elements  << element 
        end
      end
      i -= 1
  end

  return top_k_elements
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