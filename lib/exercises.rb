# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(p * n log n) where p is the number of strings
# Space Complexity: O(n)
def grouped_anagrams(strings)
  hash = {}

  strings.each do |string|
    sorted_string_array = string.split("").sort

    if hash[sorted_string_array]
      hash[sorted_string_array] << string
    else
      hash[sorted_string_array] = [string]
    end
  end

  answer = []

  hash.each do |key, value|
    answer.push(value)
  end

  return answer
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  return [] if list.empty?

  hash = {}

  list.each do |element|
    if hash[element]
      hash[element] += 1
    else
      hash[element] = 1
    end
  end

  answer = []
  answer_length = 0

  highest_freq = hash.values.max

  while answer_length < k
    hash.each do |element, count|
      if count == highest_freq
        answer << element
        answer_length += 1
      end

      break if answer_length == k
    end

    highest_freq -= 1
  end

  return answer
end

# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: ?
# Space Complexity: ?

def check_numbers(data)
  hash = {}

  data.each do |number|
    integer = number.to_i

    if integer > 0 && integer < 10
      if hash[integer]
        return false
      else
        hash[integer] = 1
      end
    end
  end

  return true
end

def valid_sudoku(table)
  # Check rows
  table.each do |row|
    unless check_numbers(row)
      return false
    end
  end

  # Check columns
  puts "im in columns"

  # Check squares

  return true

end
