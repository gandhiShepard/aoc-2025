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

  @spec part1(String.t) :: non_neg_integer
  def part1("priv/" <> _rest_of_path = path_to_data) do
    path_to_data
    |> stream_input()
    |> Enum.reduce([50], fn
      "L" <> num_string, [curr_position | _rest] = acc ->
        {num, _} = Integer.parse(num_string)
        new_position = rem((curr_position - num + 100), 100)
        [new_position | acc]

      "R" <> num_string, [curr_position | _rest] = acc ->
        {num, _} = Integer.parse(num_string)
        new_position = rem(curr_position + num, 100)
        [new_position | acc]
    end)
    |> Enum.count(& &1 == 0)
  end

  def part1(_incorrect_input), do: raise(ArgumentError, "input must be a path to a file in the priv directory")

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
      "L" <> num_string, [{curr_position, _passes} | _rest] = acc ->
        {num, _} = Integer.parse(num_string)

        passes = div(num, 100)
        remaining_rotation = rem(num, 100)

        new_position = rem((curr_position - remaining_rotation + 100), 100)

        total_passes = if curr_position != 0 && curr_position - remaining_rotation <= 0, do: 1 + passes, else: passes
        [{new_position, total_passes} | acc]

      "R" <> num_string, [{curr_position, _rotations} | _rest] = acc ->
        {num, _} = Integer.parse(num_string)

        passes = div(num, 100)
        remaining_rotation = rem(num, 100)

        new_position = rem(curr_position + remaining_rotation, 100)

        total_passes = if curr_position != 0 && curr_position + remaining_rotation >= 100, do: 1 + passes, else: passes
        [{new_position, total_passes} | acc]
    end)
    |> Enum.reduce(0, fn
      {_, passes}, acc -> acc + passes
    end)

  end

  def part2(_incorrect_input), do: raise(ArgumentError, "input must be a path to a file in the priv directory")

  # ------------------------------------------------------------------------------

  defp stream_input(input) do
    File.stream!(input) |> Stream.map(&String.trim/1)
  end
end
