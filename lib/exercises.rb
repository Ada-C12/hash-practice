

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n) where n is the number of strings
# Space Complexity: O(n) where n is the number of strings
def grouped_anagrams_version_1(strings)
  length = strings.length
  # kind of arbitrary but it seems big enough to get a good spread?
  upper_bound = length * 3
  hash = Array.new(upper_bound)

  strings.each do |string|
    hashed_index = get_hashed_index(string, upper_bound)
    if hash[hashed_index].nil?
      hash[hashed_index] = [string]
    else
      hash[hashed_index].push(string)
    end
  end

  return get_clean_hash(hash)
end

def get_numerical_key(string)
  return string.bytes.sum
end

def get_hashed_index(string, upper_bound)
  return get_numerical_key(string) % upper_bound
end

def get_clean_hash(hash)
  clean = []
  hash.each do |item|
    if !item.nil?
      clean << item
    end
  end
  return clean
end

# Time Complexity: O(n * m log m) where n is the number of strings and m is the number of characters in the string,
#                 assuming it's m log m to sort the characters
# Space Complexity: O(n + m) where n is the number of strings and m is the number of characters in the string
def grouped_anagrams(strings)
  hash = {}
  strings.each do |string|
    key = get_key(string)
    if hash[key].nil?
      hash[key] = [string]
    else
      hash[key].push(string)
    end
  end

  return hash.values
end

def get_key(string)
  return string.chars.sort.join
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n) where n is the number of elements in the list
# Space Complexity: O(n * k) where n is the number of elements in the list and k is the value of k
def top_k_frequent_elements(list, k)
  return [] if list.empty?

  hash = {}
  list.each do |item|
    if hash[item].nil?
      hash[item] = 1
    else
      hash[item] += 1
    end
  end

  max_list = []
  while max_list.length < k
    max_key = get_max(hash)
    hash.delete(max_key)
    max_list.push(max_key)
  end

  return max_list
end

def get_max(hash)
  keys = hash.keys
  max_key = keys[0]
  max_value = hash[max_key]
  keys.each do |key|
    if hash[key] > max_value
      max_key = key
      max_value = hash[key]
    end
  end
  return max_key
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