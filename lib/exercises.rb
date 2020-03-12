

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: n*m*1 (n = number of strings, m = number of characters in each string, 1 for the lookups on the hash)
# Space Complexity: depends on the number of strings with distinct sets of letters, worst case n for a hash key for each string

def grouped_anagrams(strings)
  # array of strings is input
  # for each string, make a hash of the number of letters - letter: count (if haven't seen the letter, add it in, if have, += 1 to value )
  # at the end of the word, add that hash to the outer hash - hash: list of words (if haven't seen the hash before, add it in with array of that word, if have, word.append)
  # in the end, return hash.values

  grouped_anagrams = {}

  strings.each do |string|
    string_letters_hash = {}
    string.each_char do |c|
      if string_letters_hash[c]
        string_letters_hash[c] += 1
      else
        string_letters_hash[c] = 1
      end
    end

    if grouped_anagrams[string_letters_hash]
      grouped_anagrams[string_letters_hash].append(string)
    else
      grouped_anagrams[string_letters_hash] = [string]
    end
  end
  # puts "Values:"
  # grouped_anagrams.each do |group|
  #   puts group
  # end
  return grouped_anagrams.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)
  raise NotImplementedError, "Method hasn't been implemented yet!"
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