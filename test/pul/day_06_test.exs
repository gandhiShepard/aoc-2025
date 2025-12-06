defmodule Pul.Day06Test do
  use ExUnit.Case, async: true
  alias Pul.Day06
  doctest Day06, import: true

  defp testsample, do: File.stream!("./test/pul/data/06_01_unit") |> Stream.map(&String.trim/1)
  defp testdata, do: File.stream!("./test/pul/data/06_01") |> Stream.map(&String.trim/1)

  describe "Day 06, part 01" do
    test "works with example" do
      assert Day06.grand_total_of_solved_tasks(testsample()) == 4277556
    end
    test "works with test data" do
      assert Day06.grand_total_of_solved_tasks(testdata()) == nil
    end
  end
  # describe "Day 06, part 02" do
  #   test "works with example" do
  #     assert Day06.count_of_fresh_ingredients(testsample()) == 14
  #   end
  #   test "works with test data" do
  #     assert Day06.count_of_fresh_ingredients(testdata()) == 344423158480189
  #   end
  # end
end
