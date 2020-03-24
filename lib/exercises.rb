# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: ?
# Space Complexity: ?

def grouped_anagrams(strings)
  anagram_tracker = {}
  result = []

  strings.each do |word|
    word_frequency_hash = {}
    word.chars.each do |letter|
      if word_frequency_hash.key?(letter)
        word_frequency_hash[letter] += 1
      else
        word_frequency_hash[letter] = 1
      end
    end

    if !anagram_tracker.key?(word_frequency_hash)
        anagram_tracker[word_frequency_hash] = []
    end
    anagram_tracker[word_frequency_hash] << word
  end

  return anagram_tracker.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)
  result = []
  return result if list.empty?
  
  freq_tracker = {}

  list.each do |num|
    if !freq_tracker.key?(num)
      freq_tracker[num] = 1
    else
      freq_tracker[num] += 1
    end
  end

  sorted_tracker = freq_tracker.sort_by {|num, freq| -freq}

  i = 0
  k.times do
    result << sorted_tracker[i][0]
    i += 1
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