defmodule Ben.Day02 do
  @moduledoc ~S"""
  # Gift Shop

  Identify the invalid product IDs
  """

  @doc ~S"""

  ### Example data

  11-22,95-115,998-1012,1188511880-1188511890,222220-222224,
  1698522-1698528,446443-446449,38593856-38593862,565653-565659,
  824824821-824824827,2121212118-2121212124

  (The ID ranges are wrapped here for legibility; in your input, they appear on a single long line.)

  The ranges are separated by commas (,); each range gives its first ID and last ID separated by a dash (-).

  Adding up all the invalid IDs, to solve challenge.

    iex> part_one("priv/data/ben/day_02_example_data.txt")
    1227775554

  """
  @spec part_one(String.t()) :: non_neg_integer
  def part_one("priv/" <> _rest_of_path = path_to_data) do
    path_to_data
    |> stream_input()

  end

  @doc ~S"""

  """
  def part_two() do

  end

  # ------------------------------------------------------------------------------

  defp stream_input(input) do
    File.read!(input)
    |> String.trim()
    |> Stream.unfold(&next_word/1)
    |> Stream.map(&String.split(&1, "-"))
    |> Stream.map(fn [left, right] -> String.to_integer(left)..String.to_integer(right) end)

    # |> Stream.map(&String.split(&1, ","))
    # |> Stream.map(&String.split(&1, "-"))
    |> Enum.to_list()
  end

  # The next_fun for Stream.unfold
  defp next_word("") do
    # When the accumulator (remaining string) is empty, stop the stream
    nil
  end

  defp next_word(remaining_string) do
    case String.split(remaining_string, ",", parts: 2) do
      [word, rest] ->
        # Yield the word, and use the 'rest' as the next accumulator
        {word, rest}

      [word] ->
        # Yield the final word, and use an empty string "" as the next accumulator
        # which will cause the next call to return nil and stop the stream.
        {word, ""}
    end
  end
end
