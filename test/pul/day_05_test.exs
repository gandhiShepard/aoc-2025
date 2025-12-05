defmodule Pul.Day05Test do
  use ExUnit.Case, async: true
  alias Pul.Day05
  doctest Day05, import: true

  defp testsample, do: File.stream!("./test/pul/data/05_01_unit") |> Stream.map(&String.trim/1)
  defp testdata, do: File.stream!("./test/pul/data/05_01") |> Stream.map(&String.trim/1)

  describe "Day 05, part 01" do
    test "works with example" do
      assert Day05.count_of_fresh_ingredients(testsample()) == 3
    end
    test "works with test data" do
      assert Day05.count_of_fresh_ingredients(testdata()) == 505
    end
  end
  # describe "Day 05, part 02" do
  #   test "works with example" do
  #     assert Day05.count_of_removable_paper_rolls(testsample()) == nil
  #   end
  #   test "works with test data" do
  #     assert Day05.count_of_removable_paper_rolls(testdata()) == 8722
  #   end
  # end
end
