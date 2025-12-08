defmodule Pul.Day08Test do
  use ExUnit.Case, async: true
  alias Pul.Day08
  doctest Day08, import: true

  defp testsample, do: File.stream!("./test/pul/data/08_01_unit") |> Stream.map(&String.trim/1)
  defp testdata, do: File.stream!("./test/pul/data/08_01") |> Stream.map(&String.trim/1)

  describe "Day 08, part 01" do
    test "works with example" do
      assert Day08.multiply_three_largest_circuits(testsample(), 10) == 40
    end
    test "works with test data" do
      assert Day08.multiply_three_largest_circuits(testdata(), 1000) == 123930
    end
  end
  # describe "Day 08, part 02" do
  #   test "works with example" do
  #     assert Day08.count_of_timelines(testsample()) == 40
  #   end
  #   test "works with test data" do
  #     assert Day08.count_of_timelines(testdata()) == 3223365367809
  #   end
  # end
end
