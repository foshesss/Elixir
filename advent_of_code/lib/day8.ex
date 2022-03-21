defmodule Day8 do

    def parse(file_name) do
        file_name
        |> File.read!
        |> String.split("\n")
        |> Enum.map(fn elem ->
            [inputs, output] = elem |> String.split(" | ")
        end)
    end

    # im about to sleep, but this problem
    # is asking to decode 4 numbers based on 10 inputs per line
    # a lot of pattern matching and comparison. little intimidating, but
    # i think i'll pull through.

    #gn my sweet child xqcL

    def day1(input) do
        input
    end
end