defmodule Day3 do

  defp binary_to_decimal([gamma, epsilon]) do
    {a, _} = Integer.parse(gamma, 2)
    {b, _} = Integer.parse(epsilon, 2)
    b * a
  end

  defp get_most_frequent([], output), do: output
  defp get_most_frequent([head|tail], li) do
    output = head
    |> List.foldl(li, fn {elem, index}, acc ->
      if elem == "1" do
        List.update_at(acc, index, &(&1 + 1)) # add one to our output list if we find a one
      else
        acc # return output list how it was
      end
    end)

    tail
    |> get_most_frequent(output) # recursion Pog
  end

  def parse(file_name) do
    file_name
    |> File.read!
    |> String.split("\n")
    |> Enum.map(fn x -> x |> String.split("", trim: true) |> Enum.with_index end)

    # set our input up like this:
    # [
    #  [[1, 0], [0, 1], [1, 2], [1, 3], [1, 4]],
    #  [[1, 0], [1, 1], [0, 2], [0, 3], [1, 4]]
    # ]
    # {element, index}
  end

  def part1([]), do: 0
  def part1(input) do
    size = Enum.count(input)

    input
    |> get_most_frequent(List.duplicate(0, Enum.count(List.first(input, []))))
    |> List.foldl(["", ""],
      fn x, [gamma, epsilon] ->
        if x > size/2 do
          [gamma <> "1", epsilon <> "0"]
        else
          [gamma <> "0", epsilon <> "1"]
        end
      end)
    |> binary_to_decimal
  end

  defp get_oxygen_rating(input, pos, half) do
    # shrink input
    # most_frequent = get_most_frequent(input, [])
    # Enum.filter(input, fn x -> x[most_frequent] == most_frequent end)


  end

  def part2(input) do
        size = Enum.count(input)

    input
    |> get_most_frequent(List.duplicate(0, Enum.count(List.first(input, []))))
    |> List.foldl(["", "", index],
      fn x, [oxygen, epsilon] ->
        if x > size/2 do
          [gamma <> "1", epsilon <> "0", index + 1]
        else
          [gamma <> "0", epsilon <> "1", index + 1]
        end
      end)
    |> binary_to_decimal
  end
end
