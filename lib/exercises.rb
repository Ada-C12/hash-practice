# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n log n)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  hash = {}

 strings.each do | word | 
  key = word.chars.sort.join
  if hash.key?(key)
    hash[key] << word 
  else
    hash[key] = [word]
  end
 end 
  result = []
  hash.each do | key, value |
    result << hash[key]
  end
  return result 
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n log n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  if list.length == 0
    return []
  end
  hash = Hash.new(0)
  list.each do |num|
    hash[num] += 1
  end
  result = hash.sort_by{|num, frequency| -frequency} # descending order
  final_result = []
  k.times do |i|
    final_result << result[i][0]
  end
  return final_result
end
