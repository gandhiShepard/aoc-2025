defmodule Pul.Day08 do

  def multiply_three_largest_circuits(junction_box_positions = %Stream{}, n_connections),
    do:
      with(
        circuit_per_junction_box = Enum.reduce(junction_box_positions, %{}, fn line, boxes ->
          case String.split(line, ",") do
            [x, y, z] -> Map.put_new(boxes, {String.to_integer(x), String.to_integer(y), String.to_integer(z)}, 0)
          end
        end),
        junction_boxes = Map.keys(circuit_per_junction_box),
        distances_by_pair = for(j1 <- junction_boxes, j2 <- junction_boxes, j1 < j2, into: %{}, do: {{j1, j2}, distance_square(j1, j2)}),
        closest_pairs = Enum.sort_by(distances_by_pair, fn {pair, distance} -> {distance, pair} end),
        circuit_per_junction_box = Enum.reduce(Enum.take(closest_pairs, n_connections), circuit_per_junction_box, &connect/2),
        circuits = (for c <- 1..Enum.max(Map.values(circuit_per_junction_box)),
                      do: (for {j, ^c} <- circuit_per_junction_box, do: j)) |> Enum.reject(&Enum.empty?/1),
        largest_three_circuits = Enum.take(Enum.sort_by(circuits, &Enum.count/1, :desc) ,3),
        do: (for c <- largest_three_circuits, reduce: 1 do
                product -> product * Enum.count(c)
              end))

  defp distance_square({x1, y1, z1}, {x2, y2, z2}), do: (x2 - x1) ** 2 + (y2 - y1) ** 2 + (z2 - z1) ** 2

  defp connect({{j1, j2}, _distance}, circuit_per_junction_box) do
    case {Map.get(circuit_per_junction_box, j1), Map.get(circuit_per_junction_box, j2)} do
      {0, 0} ->
        new_circuit = Enum.max(Map.values(circuit_per_junction_box)) + 1
        circuit_per_junction_box
        |> Map.put(j1, new_circuit)
        |> Map.put(j2, new_circuit)

      {c1, c1} ->
        circuit_per_junction_box

      {c1, 0} ->
        circuit_per_junction_box
        |> Map.put(j2, c1)

      {0, c2} ->
        circuit_per_junction_box
        |> Map.put(j1, c2)

      {c1, c2} ->
        Map.new(circuit_per_junction_box, fn
          {j, ^c2} -> {j, c1}
          entry -> entry
        end)
    end
  end
end
