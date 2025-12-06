defmodule Pul.Day06 do

  def grand_total_of_solved_tasks(task_table = %Stream{}),
    do:
      with(
        tasks = tasks(task_table),
        do: (for task <- tasks, reduce: 0 do
          grand_total -> grand_total + solve(task)
        end))

  defp tasks(task_table = %Stream{}),
    do:
      task_table
      |> Stream.map(&String.split/1)
      |> Enum.zip()

  defp solve(task) when is_tuple(task),
    do:
      with(
        number_of_args = tuple_size(task) - 1,
        op = elem(task, number_of_args),
        reducer = reducer(op),
        do: Enum.reduce(1..number_of_args-1, String.to_integer(elem(task, 0)), fn arg_index, result ->
          reducer.(result, String.to_integer(elem(task, arg_index))) end))

  defp reducer("+"), do: &Kernel.+/2
  defp reducer("*"), do: &Kernel.*/2

end
