
defmodule Ben.Day02Test do
  use ExUnit.Case, async: true

  alias Ben.Day02
  doctest Day02, import: true

  # describe "Part 1" do
  #   test "should return an integer indicating the sum of all the invalid IDs found" do
  #     path_to_data = "priv/data/ben/day_02_data.txt"
  #     assert Day02.part_one(path_to_data) == 1
  #   end
  # end

  # describe "Part 2" do
  #   test "should return an integer indicating the total amount of times the dial landed on 0 AND also passed by zero on a turn" do
  #     path_to_data = "priv/data/ben/day_01_data.txt"
  #     assert Day02.part_two(path_to_data) == 1
  #   end
  # end
end
