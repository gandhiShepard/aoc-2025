defmodule Pul.Day02Test do
  use ExUnit.Case, async: true
  alias Pul.Day02
  doctest Day02, import: true

  defp testsample, do: File.read!("./test/pul/data/02_01_unit")
  defp testdata, do: File.read!("./test/pul/data/02_01")

  describe "Day 02, part 01" do
    test "works with example" do
      assert Day02.sum_of_invalid_IDs(testsample()) == 1227775554
    end
    test "works with test data" do
      assert Day02.sum_of_invalid_IDs(testdata()) == nil
    end
  end
  describe "Day 02, part 02" do
    test "works with example" do
      assert Day02
    end
    test "works with test data" do
      assert Day02
    end
  end
end
