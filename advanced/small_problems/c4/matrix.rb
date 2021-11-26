# def transpose(matrix)
#   result = []
#   trans_row1 = []
#   trans_row2 = []
#   trans_row3 = []

#   matrix.each do |row|
#     trans_row1 << row[0]
#     trans_row2 << row[1]
#     trans_row3 << row[2]
#   end

#   result << trans_row1
#   result << trans_row2
#   result << trans_row3
#   result
# end

# LS
# def transpose(matrix)
#   result = []
#   (0..2).each do |column_index|
#     new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
#     result << new_row
#   end
#   result
# end

# Tonio Serna
def transpose(matrix)
  idx_count = -1

  matrix.map do |_|
    idx_count +=1
    matrix.map { |subary| subary[idx_count] }
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

matrix.each { |subary| p subary[0] }
matrix.each { |subary| p subary[1] }

p new_matrix #== [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]