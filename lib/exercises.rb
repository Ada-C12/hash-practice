

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O((n * m), where n is the number of elements in strings and m is the average length of an element in strings)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  anagram_hashes = []
  strings.each do |string|
    anagram_match = false
    new_hash = {}
    string.each_char do |n|
      if new_hash[n]
        new_hash[n] += 1
      else
        new_hash[n] = 1
      end 
    end
    anagram_hashes.each do |stored_hash|
      if stored_hash["hash"] == new_hash 
        stored_hash["words"] << string
        anagram_match = true
      end 
    end 
    if anagram_match == false
      anagram_hashes << {
        "words" => [string],
        "hash" => new_hash
      }
    end 
  end 
  list = []
  anagram_hashes.each do |current_hash|
    list << current_hash["words"]
  end 
  return list 
end

# This method will return the k most common elements
# in the case of a tie it will select the first occurring element.
# Time Complexity: O(n + k, where n is the length of the list parameter)
# Space Complexity: O(n, where n is the number of unique elements in the list)
def top_k_frequent_elements(list, k)
  frequency_hash = {}
  list.each do |n|
    if frequency_hash[n] 
      frequency_hash[n] += 1
    else 
      frequency_hash[n] = 1
    end 
  end 
  answer = []
  k.times do 
    highest_freq = 0
    frequency_hash.each_value do |value|
      highest_freq = value if value > highest_freq
    end 
    most_frequent_el = frequency_hash.key(highest_freq)
    answer << most_frequent_el if most_frequent_el
    frequency_hash.delete(most_frequent_el)
  end 
  return answer
end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: O(n) (would be O(3n) before dropping constant)
# Space Complexity: O(n) (same)
def valid_sudoku(table)
  table.each do |row|
    return false if !valid_sudoku_helper(row)
  end 
  9.times do |n|
    column_array = []
    table.each do |row|
      column_array << row[n]
    end 
    return false if !valid_sudoku_helper(column_array)
  end 
  start_row = 0
  end_row = 2
  3.times do 
    start_column = 0
    end_column = 2
    3.times do 
      return false if !valid_sudoku_helper(sub_box_builder(table, start_row, end_row, start_column, end_column))
      start_column += 3
      end_column += 3
    end 
    start_row += 3
    end_row += 3
  end 
  return true
end

def valid_sudoku_helper(array)
  digit_hash = {}
  array.flatten.each do |n|
    if n != "." && digit_hash[n]
      return false 
    else
      digit_hash[n] = true
    end 
  end
  return true
end 

def sub_box_builder(table, start_row, end_row, start_column, end_column)
  sub_box = []
  (start_row..end_row).each do |row_index|
    sub_box << table[row_index][start_column..end_column]
  end 
  return sub_box
end 