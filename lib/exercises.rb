

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n), assume the length of each word in strings is constant
# Space Complexity: O(n)

def grouped_anagrams(strings)
  res = []
  return res if strings.empty?
  hash = {}
  strings.each do |word|
    key = word.split("").sort.join
    if hash[key]
      hash[key] << word
    else
      hash[key] == [word]
    end
  end
  hash.each do |k, v|
    res << v 
  end
  return res
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(k * n) ~= O(n) if k is small
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  res = []
  return res if list.empty?
  hash = {}
  list.each do |num|
    if hash[num]
      hash[num] += 1
    else
      hash[num] = 1
    end
  end
  
  k.times do 
    max = nil
    hash.each do |num, v|
      if v && (max.nil? || v > max)
        max = num 
      end
    end
    if max
      hash[max] = nil
      res << max
    end
  end
  
  return res
end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: O(n), n is the length of table
# Space Complexity: O(n), n is the length of table
def valid_sudoku(table)
  l = table.length
  # row, time l * l
  table.each do |row|
    return false if !sudoku_helper(row)
  end
  
  # column, time l * 2l
  l.times do |i|
    column = []
    l.times do |j|
      column << table[j][i]
    end
    return false if !sudoku_helper(column)
  end
  
  # area, time  l * 2l
  x = Integer.sqrt(l)
  m = n = 0
  x.times do
    x.times do 
      area = []
      x.times do |i|
        area += table[n + i][m...(m+x)]
      end
      return false if !sudoku_helper(area)
      m += x
    end
    n += x
    m = 0
  end
  return true
end

def sudoku_helper(list)
  hash = {}
  list.each do |c|
    num = c.to_i
    if num > 0 && hash[num]
      return false
    elsif num > 0 && !hash[num]
      hash[num] = 1
    end
  end
  return true
end