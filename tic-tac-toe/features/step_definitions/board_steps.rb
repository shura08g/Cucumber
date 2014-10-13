Given(/^a board like this:$/) do |table|
  # table is a Cucumber::Ast::Table
  @board = table.raw
  puts @board
end

When(/^player x plays in row (\d+), column (\d+)$/) do |row, col|
  #puts @board
  row, col = row.to_i, col.to_i
  @board[row][col] = 'x'
end

Then(/^the board should look like this:$/) do |expected_table|
  # table is a Cucumber::Ast::Table
  expected_table.diff!(@board)
  puts @board
end