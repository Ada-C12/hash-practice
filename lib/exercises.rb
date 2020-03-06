# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(nmlogm) n for number of words, m for letters
# Space Complexity: O(n)

def grouped_anagrams(strings)
  letter_combos = Hash.new
  strings.each do |word|
    letters = word.chars.sort
    sorted_letters = letters.join
    if !letter_combos.has_key?(sorted_letters)
      letter_combos[sorted_letters] = [word]
    else letter_combos[sorted_letters] << word
    end
  end
  return letter_combos.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(nlogn) [see two implementations below. Is sort_by faster than max_by?]
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  hash = Hash.new
  array = Array.new
  return [] if list.empty?
  list.each do |element|
    if hash.has_key?(element)
      hash[element] += 1
    else hash[element] = 1
    end
  end
  # k.times do
  #   max = hash.max_by {|k, v| v}[0]
  #   array << max
  #   hash.delete(max)
  # end
  # return array
  hash.sort_by {|k, v| -v}
  array = hash.keys
  return array[0..(k-1)]
end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same
#   row, column or 3x3 subgrid
# Time Complexity: O(n) with n as the number of numbers
# Space Complexity: O(n)
def valid_sudoku(table)
  # rows
  table.each do |subarray|
    if !valid_sudoku_helper(subarray)
      return false
    end
  end
  
  # columns
  index_counter = 0
  while index_counter <= 8
    column_array = Array.new
    table.each do |subarray|
      column_array << subarray[index_counter]
    end
    if !valid_sudoku_helper(column_array)
      return false
    end
    index_counter += 1
  end
  
  # sub-boxes
  top = 0
  bottom = 2
  left = 0
  right = 2
  
  while bottom <= 8
    while right <=8
      sub_box_array = Array.new
      while top <= bottom
        while left <= right
          sub_box_array << table[top][left]
          left += 1
        end
        left -= 3
        top += 1
      end
      if !valid_sudoku_helper(sub_box_array)
        return false
      end
      top -= 3
      left += 3
      right += 3
    end
    left = 0
    right = 2
    top += 3
    bottom += 3
  end
  return true
end

def valid_sudoku_helper(array)
  hash = Hash.new
  array.each do |num|
    if num != '.' && hash.has_key?(num)
      return false
    elsif num != '.'
      hash[num] = 'present'
    end
  end
  return true
end
