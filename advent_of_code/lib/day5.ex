defmodule Day5 do

  defp remove_empty([], ret), do: ret
  defp remove_empty([[]|tail], ret), do: remove_empty(tail, ret)
  defp remove_empty([head|tail], ret), do: remove_empty(tail, [head|ret])

  def parse(file_name) do
    file_name
    |> File.read!
    |> String.split("\n", trim: true) # [s1, s2]
    |> Enum.map(fn line ->
        [x1, y1, x2, y2] = String.split(line, [" -> ", ","])

        {x1, _} = Integer.parse(x1)
        {x2, _} = Integer.parse(x2)
        {y1, _} = Integer.parse(y1)
        {y2, _} = Integer.parse(y2)

        if x1 == x2 or y1 == y2 do
          [x1, y1, x2, y2]
        else
          []
        end
    end)
    |> remove_empty([])
  end

  # for debugging
  # defp print(input) do
  #   input
  #   |> List.foldl(0, fn x, _ ->
  #     IO.puts(x <> "\n")
  #   end)
  # end

  defp hash_function({x, y}) do
    to_string(x) <> "_" to_string(y)
  end

  defp find_collisions([], map), do: map
  defp find_collisions([head|tail], map) do
    # find all collisions with head (if there are any)
    # add each collision point to map
    # map[collision_hash] = map[collision_hash] + 1 or 1

    [hx1, hy1, hx2, hy2] = head

    tail
    |> List.foldl(0, fn [x1, y1, x2, y2], _ ->
      # do math for this

    end)
  end

  def part1(input) do
    input
    |> find_collisions(%{})
    |> count_more_than_two
  end
end
