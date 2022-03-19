defmodule Day5 do

  defp remove_empty([], ret), do: ret
  defp remove_empty([[]|tail], ret), do: remove_empty(tail, ret)
  defp remove_empty([head|tail], ret), do: remove_empty(tail, [head|ret])

  def parse(file_name, remove_diagonals) do
    li = file_name
    |> File.read!
    |> String.split("\n", trim: true) # [s1, s2]
    |> Enum.map(fn line ->
        [x1, y1, x2, y2] = String.split(line, [" -> ", ","])

        {x1, _} = Integer.parse(x1)
        {x2, _} = Integer.parse(x2)
        {y1, _} = Integer.parse(y1)
        {y2, _} = Integer.parse(y2)

        cond do
          remove_diagonals == false -> [x1, y1, x2, y2]
          x1 == x2 or y1 == y2 -> [x1, y1, x2, y2]
          true -> []
        end
    end)
    |> remove_empty([])
  end

  defp add_point_to_map(x, y, map) do
    current_point = to_string(x) <> "_" <> to_string(y)

    map
    |> Map.put(current_point, Map.get(map, current_point, 0) + 1)
  end

  defp add_segment_to_map([x1, y1, x2, y2], map) when x1 == x2 and y1 == y2, do: add_point_to_map(x1, y1, map)
  defp add_segment_to_map([x1, y1, x2, y2], map) when y1 == y2 do
    updated_map = add_point_to_map(x1, y1, map)

    cond do
      x1 > x2 -> add_segment_to_map([x1 - 1, y1, x2, y2], updated_map)
      true -> add_segment_to_map([x1 + 1, y1, x2, y2], updated_map)
    end
  end

  defp add_segment_to_map([x1, y1, x2, y2], map) when x1 == x2 do
    updated_map = add_point_to_map(x1, y1, map)

    cond do
      y1 > y2 -> add_segment_to_map([x1, y1 - 1, x2, y2], updated_map)
      true -> add_segment_to_map([x1, y1 + 1, x2, y2], updated_map)
    end
  end

  defp add_segment_to_map([x1, y1, x2, y2], map) do
    updated_map = add_point_to_map(x1, y1, map)

    cond do
      x1 > x2 and y1 > y2 -> add_segment_to_map([x1 - 1, y1 - 1, x2, y2], updated_map)
      x1 < x2 and y1 > y2 -> add_segment_to_map([x1 + 1, y1 - 1, x2, y2], updated_map)
      x1 > x2 and y1 < y2 -> add_segment_to_map([x1 - 1, y1 + 1, x2, y2], updated_map)
      x1 < x2 and y1 < y2 -> add_segment_to_map([x1 + 1, y1 + 1, x2, y2], updated_map)
    end
  end

  defp check_segments(input) do
    input
    |> List.foldl(%{}, fn segment, map ->
      add_segment_to_map(segment, map)
    end)
  end

  def part1(input) do
    input
    |> check_segments
    |> Map.values
    |> Enum.count(fn elem ->
      elem >= 2
    end)
  end

  def part2(input) do
    input
    |> check_segments
    |> Map.values
    |> Enum.count(fn elem ->
      elem >= 2
    end)
  end
end
