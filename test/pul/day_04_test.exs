defmodule Pul.Day04Test do
  use ExUnit.Case, async: true
  alias Pul.Day04
  doctest Day04, import: true

  defp testsample, do: File.stream!("./test/pul/data/04_01_unit") |> Stream.map(&String.trim/1)
  defp testdata, do: File.stream!("./test/pul/data/04_01") |> Stream.map(&String.trim/1)

  describe "Day 04, part 01" do
    test "works with example" do
      assert Day04.count_of_accesible_paper_rolls(testsample()) == 13
    end
    test "works with test data" do
      assert Day04.count_of_accesible_paper_rolls(testdata()) == nil
    end
  end
  describe "Day 04, part 02" do
    test "works with example" do
      assert Day04.count_of_accesible_paper_rolls(testsample()) == nil
    end
    test "works with test data" do
      assert Day04.count_of_accesible_paper_rolls(testdata()) == nil
    end
  end
end
