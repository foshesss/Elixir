# THIS IS SOOOOO MESSY

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

  defp get_most_frequent_at(input, index) do 
    size = Enum.count(input)/2
    num_one = Enum.count(input, fn x -> {elem, _i} = Enum.at(x, index); elem == "1" end)

    if size > num_one, do: "0", else: "1"
  end

  defp get_least_frequent_at(input, index) do
      size = Enum.count(input)/2
      num_one = Enum.count(input, fn x -> {elem, _i} = Enum.at(x, index); elem == "1" end)

      if size > num_one, do: "1", else: "0"
  end

  # potential case.. what if more than one in input and index is out of bounds (?)

  defp get_oxygen_rating(input, index) do
    if Enum.count(input) == 1 do
      List.first(input)
    else
       i = get_most_frequent_at(input, index) # most frequent at an index options: ["0", "1"]

      input
      |> Enum.filter(fn x -> {elem, _i} = Enum.at(x, index); elem == i end) # get rid of all inputs where the index DNE i
      |> get_oxygen_rating(index + 1) # recursive call to continue finding
    end
  end

  defp get_gamma_rating(input, index) do
    if Enum.count(input) == 1 do
      List.first(input)
    else
       i = get_least_frequent_at(input, index) # least frequent at an index options: ["0", "1"]

      input
      |> Enum.filter(fn x -> {elem, _i} = Enum.at(x, index); elem == i end) # get rid of all inputs where the index DNE i
      |> get_gamma_rating(index + 1) # recursive call to continue finding
    end
  end

  def get_string_rep(li) do
    li
    |> List.foldl("", fn {elem, _i}, acc -> acc <> elem end)
  end

  def part2(input) do
    binary_to_decimal([get_string_rep(get_oxygen_rating(input, 0)), get_string_rep(get_gamma_rating(input, 0))])
  end
end
