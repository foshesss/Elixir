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


    defp get_smallest_dist(smallest) do
        
    end

    def part1(input) do
        input
    end
end