defmodule Pul.Day04 do

  @roll ?@
  def count_of_accessible_paper_rolls(grid_rows),
    do:
      grid_rows
      |> to_map()
      |> then(fn grid_map -> Enum.count(grid_map, &accessible_paper_roll?(&1, grid_map)) end)

  defp to_map(grid_rows = %Stream{}),
    do:
      grid_rows
      |> Stream.with_index(0)
      |> Enum.reduce(%{}, fn {row, r}, map when is_binary(row) and is_integer(r)->
        for({@roll, c} <- to_charlist(row) |> Enum.with_index(0), into: map, do: {{r, c}, @roll})
      end)

  defp accessible_paper_roll?({{r, c}, @roll}, grid_map = %{}),
    do:
      (for dr <- -1..1,
        dc <- -1..1,
        not(dr == 0 and dc == 0),
        Map.get(grid_map, {r + dr, c + dc}) == @roll,
        reduce: 0 do
          neighbour_rolls -> neighbour_rolls + 1
        end) < 4

  def count_of_removable_paper_rolls(grid_rows),
    do:
      with(
        original_map = to_map(grid_rows),
        map_after_removing = remove_all_accessible_paper_rolls(original_map),
        do: Enum.count(original_map) - Enum.count(map_after_removing))

  defp remove_all_accessible_paper_rolls(grid_map = %{}) do
    case (for cell <- grid_map, !accessible_paper_roll?(cell, grid_map), into: %{}, do: cell) do
      ^grid_map -> grid_map
      map_after_removing -> remove_all_accessible_paper_rolls(map_after_removing)
    end
  end

end
