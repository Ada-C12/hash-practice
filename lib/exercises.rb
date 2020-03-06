

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: ?
# Space Complexity: ?

def grouped_anagrams(strings)
  raise NotImplementedError, "Method hasn't been implemented yet!"
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
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
  until output.length == k do
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
# Time Complexity: ?
# Space Complexity: ?
def valid_sudoku(table)
  raise NotImplementedError, "Method hasn't been implemented yet!"
end