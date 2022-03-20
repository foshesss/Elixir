defmodule Day7 do
    def parse(file_name) do
        file_name
        |> File.read!
        |> String.split(",")
        |> Enum.map(fn elem ->
            {e, _} = Integer.parse(elem)
            e
        end)
    end


    defp get_smallest(_input, -1, smallest, _sum), do: smallest
    defp get_smallest(input, target, smallest, summation) do
        total = input
        |> List.foldl(0, fn elem, acc ->
            fuel = abs(elem - target)
            fuel = cond do 
                summation == true -> Enum.to_list(1..fuel)
                |> List.foldl(0, fn curr, f ->
                    curr + f
                end)
                true -> fuel
            end

            acc + fuel
        end)

        smallest = if smallest == -1 or smallest > total, do: total, else: smallest

        input
        |> get_smallest(target - 1, smallest, summation)
    end

    defp helper(input, sum) do
        max = input
        |> List.foldl(0, fn elem, acc ->
            if elem > acc, do: elem, else: acc
        end)

        get_smallest(input, max, -1, sum)
    end

    def part1(input) do
        input
        |> helper(false)
    end

    def part2(input) do
        input
        |> helper(true)
    end
end