=begin
Problem
  input: array representing a matrix; arbitray dimensions
  output: array representing the input matrix rotated 90 degrees

Examples
  first row becomes last column
  nth row becomes (rows - n + 1)th column
  last row becomes first column
  4 rotations should give original matrix

  elements in the first row become last elements of each new row
  array[0][0] -> new[0][number of rows - 1]
  arr[0][1] ->  new[1][rows - 1]
  arr[size - 1]

  first row is first element of each input row, in reverse
  nth row contains nth element of each input row, in reverse

Data
  input array
  new row array

Algorithm
  initialize results arr
  matrix[0] length times (num of new rows)
  build_row helper (row index)
    initialize row array
    iterate through matrix
      add nth element of each row
    return reversed row array
  return results

  # map version
  new var with reversed matrix
  result is
=end

# def rotate90(matrix)
#   result = []
#   new_row_count = matrix[0].length
#   new_row_count.times do |row_index|
#     result << build_row(row_index, matrix)
#   end
#   result
# end

# def build_row(row_index, matrix)
#   row = []
#   matrix.each { |subarr| row << subarr[row_index] }
#   row.reverse
# end

def rotate90(matrix)
  result = []
  number_of_rows = matrix.size
  number_of_columns = matrix.first.size
  (0...number_of_columns).each do |column_index|
    new_row = (0...number_of_rows).map do |row_index|
      matrix[row_index][column_index]
    end
    result << new_row.reverse
  end
  result
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6],
]
# m
matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2