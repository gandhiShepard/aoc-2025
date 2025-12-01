defmodule Pul.Day01 do

  def count_zero_passes(dials, dial_and_count \\ {50, 0})
  def count_zero_passes(<<?R, h, d, s, ?\n, dials::binary>>, dc), do: count_zero_passes(dials, dial(100*(h-?0) + 10*(d-?0) + (s-?0), dc))
  def count_zero_passes(<<?R, d, s, ?\n, dials::binary>>, dc), do: count_zero_passes(dials, dial(10*(d-?0) + (s-?0), dc))
  def count_zero_passes(<<?R, s, ?\n, dials::binary>>, dc), do: count_zero_passes(dials, dial((s-?0), dc))
  def count_zero_passes(<<?L, h, d, s, ?\n, dials::binary>>, dc), do: count_zero_passes(dials, dial(-100*(h-?0) - 10*(d-?0) - (s-?0), dc))
  def count_zero_passes(<<?L, d, s, ?\n, dials::binary>>, dc), do: count_zero_passes(dials, dial(-10*(d-?0) - (s-?0), dc))
  def count_zero_passes(<<?L, s, ?\n, dials::binary>>, dc), do: count_zero_passes(dials, dial(-(s-?0), dc))
  def count_zero_passes("", {_dial, count}), do: count

  defp dial(offset, {dial, _count} = dc) when dial + offset < 0, do: dial(offset + 100, dc)
  defp dial(offset, {dial, _count} = dc) when dial + offset > 99, do: dial(offset - 100, dc)
  defp dial(offset, {dial, count}) when dial == -offset, do: {0, count + 1}
  defp dial(offset, {dial, count}), do: {dial + offset, count}

  def part2(args) do
  end
end
