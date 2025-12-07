defmodule Pul.Day07 do

  def count_of_splits(tachyon_manifold = %Stream{}),
    do:
      tachyon_manifold
      |> Enum.reduce({nil, 0}, fn
        row, {nil, splits} -> {row, splits}
        <<>>, {_p, splits} -> splits
        row, {p, splits} -> process_row(row, p, <<>>, splits)
      end)
      |> then(fn {_last_row, splits} -> splits end)

  defp process_row(row, previous_row, resulting_row, count_of_splits)
  defp process_row(<<>>, <<>>, r, splits), do: {r, splits}
  defp process_row(<<?., ?^, ?., row::binary>>, <<_::8, ?|, _::8, p::binary>>, r, splits),
    do: process_row(row, p, r <> <<?|, ?., ?|>>, splits + 1)
  defp process_row(<<?^, ?., row::binary>>, <<?|, _::8, p::binary>>, r, splits),
    do: process_row(row, p, r <> <<?., ?|>>, splits + 1)
  defp process_row(<<?., row::binary>>, <<?., p::binary>>, r, splits),
    do: process_row(row, p, r <> <<?.>>, splits)
  defp process_row(<<?., row::binary>>, <<?|, p::binary>>, r, splits),
    do: process_row(row, p, r <> <<?|>>, splits)
  defp process_row(<<?., row::binary>>, <<?^, p::binary>>, r, splits),
    do: process_row(row, p, r <> <<?.>>, splits)
  defp process_row(<<?., row::binary>>, <<?S, p::binary>>, r, splits),
    do: process_row(row, p, r <> <<?|>>, splits)
  defp process_row(<<?^, row::binary>>, <<?., p::binary>>, r, splits),
    do: process_row(row, p, r <> <<?^>>, splits)

end
