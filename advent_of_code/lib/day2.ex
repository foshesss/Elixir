# i smile when rosie comes to see me :)

defmodule Day2 do
  def parse(file_name) do
    file_name
    |> File.read!
    |> String.split("\n") # split by new line

    # need to create some sort of list that looks like this:
    # [[forward, 5], [up, 6], [down, 4]].
    |> Enum.map(fn x ->
      [direction, num] = x |> String.split(" ");
      [String.to_existing_atom(direction) , String.to_integer(num)]
    end)
  end

  defp part1_helper([], depth, horiz), do: [depth, horiz]
  defp part1_helper([[direction, num]|tail], depth, horiz) do
    case direction do
      :up -> part1_helper(tail, depth - num, horiz)
      :down -> part1_helper(tail, depth + num, horiz)
      :forward -> part1_helper(tail, depth, horiz + num)
    end
  end

  def part1(input) do
    [depth, horiz] = part1_helper(input, 0, 0)
    depth * horiz
  end

  defp part2_helper([], depth, horiz, _aim), do: [depth, horiz]
  defp part2_helper([[direction, num]|tail], depth, horiz, aim) do

    IO.puts("Depth: #{depth}, Horiz: #{horiz}, Aim: #{aim}")
    IO.puts("Direction: #{direction}, Amnt: #{num}")

    case direction do
      :up -> part2_helper(tail, depth, horiz, aim - num)
      :down -> part2_helper(tail, depth, horiz, aim + num)
      :forward -> part2_helper(tail, depth + aim * num, horiz + num, aim)
    end
  end


  def part2(input) do
    [depth, horiz] = part2_helper(input, 0, 0, 0)
    depth * horiz
  end
end
