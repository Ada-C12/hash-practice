

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n * m) where n is the length of the array and m is the length of the longest word
# Space Complexity: O(n)

def grouped_anagrams(strings)
  hash = {}
  strings.each do |string|
    baby_hash = {}
    string.each_char do |char|
      if baby_hash[char]
        baby_hash[char] += 1
      else
        baby_hash[char] = 1
      end
    end
   if hash[baby_hash]
    hash[baby_hash] << string
   else
    hash[baby_hash] = [string]
   end
  end

  output = []
  hash.each do |k, v| 
    output << v
  end
  return output
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)
  hash = {}
  list.each do |num|
    if hash[num]
      hash[num] += 1
    else
      hash[num] = 1
    end
  end

  result = []
  k.times do |index|
    max = hash.key(hash.values.max)
    if max
      result << max
      hash.delete(max)
    end
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