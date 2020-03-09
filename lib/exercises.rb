

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n * m) where n is the number of characters in the longest word and m is the size of the input array
# It might actually simplify to just O(n) where n is the total number of input charcters, because you're only sorting each word once
# Space Complexity: O(n) where n is the size of the input array

def grouped_anagrams(strings)
  return [] if strings.empty?
  hash = {}
  
  strings.each do |string|
    alphebetized = string.chars.sort.join
    if hash[alphebetized]
      hash[alphebetized] << string
    else
      hash[alphebetized] = [string]
    end
  end
  
  return hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n) where n is the size of the array
# Space Complexity: O(n) where n is the size of the array
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
  
  result = hash.keys.sort_by {|key, value| hash[key] <=> hash[value]}
  result = result[0...k]
  return result
  
end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: O(1) because there are always 81 squares in the grid, otherwise would be O(n * m) where n is the number of rows and n is the number of columns
# Space Complexity: O(n) where n is the number of numbers filled in...although the maximum is 81 numbers so could be O(1)
def valid_sudoku(table)
  hash = {}
  
  9.times do |i|
    hash["Row #{i}"] = []
    hash["Box #{i + 1}"] = []
    hash["Column #{i}"] = []
  end
  
  table.each_with_index do |row, row_number|
    
    row.each_with_index do |number, index|
      if (0..2).include?(row_number)
        if (0..2).include?(index)
          box_number = 1
        elsif (3..5).include?(index)
          box_number = 2
        elsif (6..8).include?(index)
          box_number = 3
        end
      elsif (3..5).include?(row_number)
        if (0..2).include?(index)
          box_number = 4
        elsif (3..5).include?(index)
          box_number = 5
        elsif (6..8).include?(index)
          box_number = 6
        end
      else
        if (0..2).include?(index)
          box_number = 7
        elsif (3..5).include?(index)
          box_number = 8
        elsif (6..8).include?(index)
          box_number = 9
        end
      end
      
      if number != "."
        return false if hash["Row #{row_number}"].include?(number) || hash["Column #{index}"].include?(number) || hash["Box #{box_number}"].include?(number)
        hash["Row #{row_number}"] << number
        hash["Column #{index}"] << number
        hash["Box #{box_number}"] << number
      end
    end
  end
  
  return true
end
