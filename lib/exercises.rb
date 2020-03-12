require 'awesome_print'

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(nm) because the method will always iterate through each string (n) in strings and then each string will be compared to all hashes (m) that have been created, which in the worst case could be the same as the number of strings
# Space Complexity: O(n) because the size of anagrams_grouped and hash_groups will grow linearly with the size of strings in the worse case
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
# Time Complexity: O(nlogn) because the sort_by method will have the time complexity of quick sort
# Space Complexity: O(n) because the size of the variables will change linearly with the size of list
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
# Time Complexity: O(n) because at method must go through the table 3 times to check for each sceniario to be valid (row, column, 3x3 grid)
# Space Complexity: O(1) because the size of the variables created is constant. (if the grid is greater than 9x9 this might change for the corners array)
def valid_sudoku(table)
  numbers = {}

  # iterate through each row and confirm valid
  row = 0
  while row < table.length
    table[row].each do |value|
      return false if !check_value(numbers, value)
    end

    numbers = {}
    row += 1
  end

  # iterate through each column and confirm valid
  numbers = {}
  col = 0
  while col < table[0].length
    (0..8).each do |x|
      value = table[x][col]

      return false if !check_value(numbers, value)
    end

    numbers = {}
    col += 1
  end

  # create list of each sub-box's upper left corner
  corners = []
  (0..2).each do |row|
    (0..2).each do |col|
      corners << [row * 3, col * 3]
    end
  end

  # iterate through the list of corners to see if each value is unique within the sub-box
  numbers = {}
  index = 0
  while index < corners.length
    (0..2).each do |x|
      (0..2).each do |y|
        x_point = corners[index][0] + x
        y_point = corners[index][1] + y
        value = table[x_point][y_point]

        return false if !check_value(numbers, value)
      end
    end

    numbers = {}
    index += 1
  end

  return true
end

def check_value(numbers, value)
  if value != "." && numbers[value]
    return false
  elsif value != "."
    numbers[value] = true
  end
  
  return true
end