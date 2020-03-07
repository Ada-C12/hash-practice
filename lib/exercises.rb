# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n * m) where n is number of strings in array and m is number of charcters in longest string
# Space Complexity: O(n * m) where n is number of strings in array and m is number of charcters in longest string
def create_char_hash(string)
  output_hash = {}
  
  string.each_char do |char|
    if output_hash[char]
      output_hash[char] += 1
    else
      output_hash[char] = 1
    end
  end

  return output_hash
end

def grouped_anagrams(strings)
  anagrams = {}
  
  strings.each do |string|
    word_hash = create_char_hash(string)

    if anagrams[word_hash]
      anagrams[word_hash] << string
    else
      anagrams[word_hash] = [string]
    end
  end
  
  return anagrams.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n) where n is number of items in list
# Space Complexity: O(n) where n is number of items in list
def get_hash_max(hash)
  hash.each { |k,v| return k if v == hash.values.max }
end

def top_k_frequent_elements(list, k)
  return [] if list.empty?
  raise ArgumentError.new("K can't be larger then length of list") if k > list.length
  
  nums = {}
  list.each do |num|
    if nums[num]
      nums[num] += 1
    else
      nums[num] = 1
    end
  end

  output = []
  k.times do
    maxKey = get_hash_max(nums)
    output << maxKey
    nums.delete(maxKey)
  end

  return output
end

# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: O(n) where n is length of table input (size sudoku)
# Space Complexity: O(n) where n is length of table input (size sudoku)
def generate_values_checker
  values = {}
  
  value = 1
  9.times do
    values[value] = false
    value += 1
  end
  
  return values
end

def generate_rows_cols_checker
  rows_cols = {}
  
  value = 0
  9.times do
    rows_cols[value] = generate_values_checker
    value += 1
  end
  
  return rows_cols
end

def generate_subgrids_checker
  subgrids = {}
  row = 0
  col = 0
  
  3.times do
    row += 1
    
    3.times do
      col += 1
      grid = [row, col]
      subgrids[grid] = generate_values_checker
    end
    
    col = 0
  end
  
  return subgrids
end

def valid_sudoku(table)
  # valid for 9x9 soduku board
  return false if table.length > 9
  
  subgrids = generate_subgrids_checker
  rows = generate_rows_cols_checker
  cols = generate_rows_cols_checker

  table.each_with_index do |row, row_index|
    row.each_with_index do |val, col_index|
      
      if val != "."
        grid = [(col_index/3 + 1), (row_index/3 + 1) ]
        return false if subgrids[grid][val]
        subgrids[grid][val] = true;
        
        return false if rows[row_index][val]
        rows[row_index][val] = true;
        
        return false if cols[col_index][val]
        cols[col_index][val] = true;
      end
    
      # checks if table is not a square
      return false if col_index > table.length - 1
    end
  end
  
  return true
end