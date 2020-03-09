require 'awesome_print'

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: ?
# Space Complexity: ?

def grouped_anagrams(strings)
  return [] if strings.empty?

  hash_groups = []
  anagrams_grouped = []

  strings.each do |string|
    string_hash = {}

    # count freq of characters in string through hash
    string.each_char do |char|
      if string_hash[char]
        string_hash[char] += 1
      else
        string_hash[char] = 1
      end
    end

    # if no hash_groups exist, add new string hash to hash group and add string to anagrams list
    if hash_groups.empty?
      hash_groups << string_hash
      anagrams_grouped << [string]
    
    # otherwise, test string hash against all previous hashes, if match, add to existing anagram group, if unique, add hash group, create new anagram group
    else
      unique = true
      hash_groups.each_with_index do |hash, index|
        if hash == string_hash
          unique = false
          anagrams_grouped[index] << string
        end
      end

      if unique
        hash_groups << string_hash
        anagrams_grouped << [string]
      end
    end
  end

  return anagrams_grouped
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)
  return [] if list.empty? || k == 0

  item_with_freq = []
  item_freq = {}

  # make hash with freq of each element
  list.each do |item|
    if item_freq[item]
      item_freq[item] += 1
    else
      item_freq[item] = 1
    end
  end

  # turn hash into array and sort by freq
  item_with_freq = item_freq.to_a
  item_with_freq.sort_by { |item| item[1] }

  # iterate through sorted array k times and pull out top items
  top_items = []
  k.times do |i|
    top_items << item_with_freq[i][0]
  end

  return top_items
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