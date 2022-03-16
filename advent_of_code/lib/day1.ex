# wassup y'all, this is Kanye. It's really me

defmodule Day1 do
  def parse(file_name) do
    file_name
    |> File.read!
    |> String.split("\n") # split by new line
    |> Enum.map(&String.to_integer/1)
  end

  def part1(input) do
    input
    |> Enum.chunk_every(2, 1, :discard) # chunk it up
    |> Enum.count(fn [x, y] -> y > x end)
  end

  def part2(input) do
    input
    |> Enum.chunk_every(3, 1, :discard) # chunk it up
    |> Enum.map(&Enum.sum/1)
    |> part1
  end
end
