defmodule Pul.Day01Test do
  use ExUnit.Case, async: true
  # doctest Aoc2025

  alias Pul.Day01
  @example """
  L68
  L30
  R48
  L5
  R60
  L55
  L1
  L99
  R14
  L82
  """
  @part01 File.read!("./test/pul/data/01_01")

  describe "Day 1" do
    test "part 1 example" do
      assert Day01.count_zero_passes(@example) == 3
    end
    test "part 1 data" do
      assert Day01.count_zero_passes(@part01) == 995
    end
  end
end
