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
  # Enum.count(base) + Enum.sum(birthdays) + babies
  defp next_day(base, birthdays, current_day, 0, babies), do: Enum.count(base) + Enum.sum(birthdays) + babies
  defp next_day(base, birthdays, current_day, remaining, babies) do
    # base is the original list that we had
    # birthdays keeps track of how many babies there are on each day
    # current day keeps track of day in the week
    # remaining is the amount of days remaining before we call it
    # babies are to be born on this day.

    # subtract 1 from each base
    base = base
    |> Enum.map(fn elem ->
      elem - 1
    end)

    # sent as an argument for the babies parameter
    to_be_born = Enum.count(base, fn elem -> elem == -1 end)

    # add to current babies-- babies is by default 0
    adults = Enum.at(birthdays, current_day)
    birthdays = birthdays
    |> List.replace_at(current_day, adults + babies)

    current_day = if current_day + 1 > 6, do: 0, else: current_day + 1

    base
    |> Enum.map(fn elem ->
      if elem == -1 do
        6
      else
        elem
      end
    end)
    |> next_day(
      birthdays,
      current_day,
      remaining - 1,
      to_be_born
    )
  end


  def part1(input) do
    input
    |> next_day([0,0,0,0,0,0,0], 0, 11, 0) # birthdays, current_day, remaining, babies
  end
end


# [3,4,3,1,2], [0,0,0,0,0,0,0], 0
# [2,3,2,0,1], [0,0,0,0,0,0,0], 1
# [1,2,1,6,0], [0,0,1,0,0,0,0], 2
# [0,1,0,5,6], [0,0,1,1,0,0,0], 3
# [6,0,6,4,5], [0,0,1,1,2,0,0], 4
# [5,6,5,3,4], [0,0,1,1,2,1,0], 5 < - day 6 <- correct
# [4,5,4,2,3], [0,0,1,1,2,1,0], 6
# [3,4,3,1,2], [0,0,1,1,2,1,0], 0 < - day 8
# [2,3,2,0,1], [0,0,1,1,2,1,0], 1
# [1,2,1,6,0], [0,0,2,1,2,1,0], 2 -> 11
