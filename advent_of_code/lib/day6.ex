# easily the best problem so far. super cool and fun to optimize

defmodule Day6 do
  def parse(file_name) do
    file_name
    |> File.read!
    |> String.split(",", trim: true)
    |> Enum.map(fn elem ->
      {i, _} = Integer.parse(elem)
      i
    end)
  end

  # need queue because offset for newborns to have kids is 8 days. 
  # they'll have a kid on day (birthday + 2), adjusting overflow where 6 -> 0
  defp next_day(birthdays, -1, _i, queue), do: Enum.sum(birthdays) + Enum.sum(queue)
  defp next_day(birthdays, day, i, [to_be_born|tail]) do
    newborns = Enum.at(birthdays, i)

    birthdays
    |> List.replace_at(i, newborns + to_be_born) # remove first from queue
    |> next_day(
      day - 1, 
      (if i + 1 > 6, do: 0, else: i + 1), 
      tail ++ [newborns] # add newborns to end of queue
      )
  end

  def part1(input) do
    List.foldl(input, [0,0,0,0,0,0,0], fn elem, base ->
      base
      |> List.replace_at(elem + 1, Enum.at(base, elem + 1) + 1)
    end)
    |> next_day(80, 0, [0, 0])
  end

  def part2(input) do
    List.foldl(input, [0,0,0,0,0,0,0], fn elem, base ->
      base
      |> List.replace_at(elem + 1, Enum.at(base, elem + 1) + 1)
    end)
    |> next_day(256, 0, [0, 0])
  end
end