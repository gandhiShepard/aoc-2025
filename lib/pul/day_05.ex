defmodule Pul.Day05 do

  def count_of_fresh_ingredients(inventory_list = %Stream{}),
    do:
      with(
        {ranges_of_fresh_ids, available_ids} = ranges_of_fresh_ids_and_available_ids(inventory_list),
        do: Enum.count(available_ids, &fresh_ingredient?(&1, ranges_of_fresh_ids)))


  defp ranges_of_fresh_ids_and_available_ids(inventory_list = %Stream{}),
    do: Enum.reduce(inventory_list, {:ranges_of_fresh_ids, [], []}, fn
            "", {:ranges_of_fresh_ids, ranges_of_fresh_ids, available_ids} ->
              {:available_ids, ranges_of_fresh_ids, available_ids}

            range_line, {:ranges_of_fresh_ids, ranges_of_fresh_ids, available_ids} ->
              [from, to] = String.split(range_line, "-") |> Enum.map(&String.to_integer/1)
              {:ranges_of_fresh_ids, [from..to | ranges_of_fresh_ids], available_ids}

            id_line, {:available_ids, ranges_of_fresh_ids, available_ids} ->
              id = String.to_integer(id_line)
              {:available_ids, ranges_of_fresh_ids, [id | available_ids]}

          end)
        |> then(fn {:available_ids, ranges_of_fresh_ids, available_ids} ->
            {Enum.reverse(ranges_of_fresh_ids), Enum.reverse(available_ids)} end)

   defp fresh_ingredient?(id, ranges_of_fresh_ids), do: Enum.any?(ranges_of_fresh_ids, & id in &1)
end
