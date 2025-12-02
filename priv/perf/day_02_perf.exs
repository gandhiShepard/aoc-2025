alias Ben.Day02, as: Bens
alias Pul.Day02, as: Puls

# Run `mix run priv/perf/day_01_perf.exs`

test_data = %{
  "bens_data_stream" => "priv/data/ben/day_02_data.txt",
  # "puls_data_stream" => "priv/data/pul/day_01_data.txt",
}

Benchee.run(
  %{
    "BEN_PART_1" => &Bens.part_one(&1),
    # "PUL_PART_1" => &Puls.part1(&1),
    #
    "BEN_PART_2" => &Bens.part_two(&1),
    # "PUL_PART_2" => &Puls.part2(&1),
  },
  inputs: test_data
)

# ------------------------------------------------------------------------------

# First Solutions

