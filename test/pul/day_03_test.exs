defmodule Pul.Day01Test do
  use ExUnit.Case, async: true
  alias Pul.Day03
  doctest Day03, import: true

  defp testsample, do: File.stream!("./test/pul/data/03_01_unit") |> Stream.map(&String.trim/1)
  defp testdata, do: File.stream!("./test/pul/data/03_01") |> Stream.map(&String.trim/1)

  describe "Day 03, part 01" do
    test "works with example" do
      assert Day03.total_output_joltage(testsample()) == 357
    end
    test "works with test data" do
      assert Day03.total_output_joltage(testdata()) == nil
    end
  end
  describe "Day 03, part 02" do
    test "works with example" do
      assert Day03.fun(testsample()) == nil
    end
    test "works with test data" do
      assert Day03.fun(testdata()) == nil
    end
  end
end
