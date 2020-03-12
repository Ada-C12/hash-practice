

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: ?
# Space Complexity: ?

def grouped_anagrams(strings)
  return [] if strings.length == 0

  sorted_strings = strings.map { |string|
    string.chars.sort.join
  }

  sorted_strings_hash = {}

  sorted_strings.each { |string|
    sorted_strings_hash[string] = []
  }

  sorted_strings.each_with_index { |string, index|
    sorted_strings_hash[string] << strings[index]
  }

  final_array = []

  sorted_strings_hash.each_value do |value|
    final_array.push(value)
  end 

  return final_array
end

# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)
  return [] if list.length == 0
  frequency_hash = {}

  list.each do |element|
    if frequency_hash[element].nil?
      frequency_hash[element] = 1
    else
      frequency_hash[element] += 1
    end 
  end 


  frequency_hash_values = frequency_hash.values
  
  sorted_frequency_hash_values = frequency_hash_values.sort

  
  sliced_sorted_frequency_hash_values = ''
  # if sorted_frequency_hash_values.first == sorted_frequency_hash_values.last && k == 1
  #   return list.first
  if sorted_frequency_hash_values.first == sorted_frequency_hash_values.last 
    return frequency_hash.keys
  end

  
  if k <= list.length
    
    sliced_sorted_frequency_hash_values = sorted_frequency_hash_values.slice(-(k), k)
  end 


  official_sliced_sorted_frequency_hash_values = sliced_sorted_frequency_hash_values.map do |value|
    frequency_hash.key(value)
  end 

  return official_sliced_sorted_frequency_hash_values
end

top_k_frequent_elements([1, 2, 3], 3)



# it "works with example 1" do
#   skip
#   # Arrange
#   list = [1,1,1,2,2,3]
#   k = 2

#   # Act
#   answer = top_k_frequent_elements(list, k)

#   # Assert
#   expect(answer.sort).must_equal [1,2]
# end

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

