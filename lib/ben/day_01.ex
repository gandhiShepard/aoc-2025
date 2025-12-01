defmodule Ben.Day01 do
  @moduledoc ~S"""
  Day 01 - Secret Entrance
  """

  @doc ~S"""
  part1/1 takes a string input containing "a sequence of rotation" needed to open a safe to get the password to open the North Pole Base.
  However, our security training tells us that we just need to count the amount of times that the dial on the safe is left pointing at 0.
  Thus, this function returns the amount of times the dial is left pointing at 0.

  ### Example data
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

  ### Example usage
  Input must be a path to a data file in the priv directory.

    iex> part1("priv/data/ben/day_01_example_data.txt")
    3

    iex> part1("hello")
    ** (ArgumentError) input must be a path to a file in the priv directory
  """

  @spec part1(String.t()) :: non_neg_integer
  def part1("priv/" <> _rest_of_path = path_to_data) do
    path_to_data
    |> stream_input()
    |> Enum.reduce([50], fn
      "L" <> increment_string, [current_position | _rest] = acc ->
        {increments, _} = Integer.parse(increment_string)
        new_position = rem(current_position - increments + 100, 100)
        [new_position | acc]

      "R" <> increment_string, [current_position | _rest] = acc ->
        {increments, _} = Integer.parse(increment_string)
        new_position = rem(current_position + increments, 100)
        [new_position | acc]
    end)
    |> Enum.count(&(&1 == 0))
  end

  def part1(_incorrect_input),
    do: raise(ArgumentError, "input must be a path to a file in the priv directory")

  # ------------------------------------------------------------------------------

  @doc ~S"""
  You remember from the training seminar that "method 0x434C49434B" means you're actually supposed to count the number of times any click causes the dial to point at 0, regardless of whether it happens during a rotation or at the end of one.

    iex> part2("priv/data/ben/day_01_example_data.txt")
    6

    iex> part2("hello")
    ** (ArgumentError) input must be a path to a file in the priv directory

  """
  def part2("priv/" <> _rest_of_path = path_to_data) do
    path_to_data
    |> stream_input()
    |> Enum.reduce([{50, 0}], fn
      "L" <> increment_string, [{current_position, _times_passing_zero} | _rest] = acc ->
        {increments, _} = Integer.parse(increment_string)
        times_passing_zero = div(increments, 100)
        remaining_increments_to_rotate = rem(increments, 100)
        new_position = rem(current_position - remaining_increments_to_rotate + 100, 100)

        total_times_passing_zero =
          if current_position != 0 && current_position - remaining_increments_to_rotate <= 0,
            do: 1 + times_passing_zero,
            else: times_passing_zero

        [{new_position, total_times_passing_zero} | acc]

      "R" <> increment_string, [{current_position, _rotations} | _rest] = acc ->
        {increments, _} = Integer.parse(increment_string)
        times_passing_zero = div(increments, 100)
        remaining_increments_to_rotate = rem(increments, 100)
        new_position = rem(current_position + remaining_increments_to_rotate, 100)

        total_times_passing_zero =
          if current_position != 0 && current_position + remaining_increments_to_rotate >= 100,
            do: 1 + times_passing_zero,
            else: times_passing_zero

        [{new_position, total_times_passing_zero} | acc]
    end)
    |> Enum.reduce(0, fn {_, times_passing_zero}, acc -> acc + times_passing_zero end)
  end

  def part2(_incorrect_input),
    do: raise(ArgumentError, "input must be a path to a file in the priv directory")

  # ------------------------------------------------------------------------------

  defp stream_input(input) do
    File.stream!(input) |> Stream.map(&String.trim/1)
  end
end
