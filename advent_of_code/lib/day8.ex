defmodule Day8 do

    # Parsing output: [inputs, outputs]
    # inputs: list of items that are used to unscramble outputs
    # outputs: items to be unscrambled based on patterns in inputs
    def parse(file_name) do
        file_name
        |> File.read!
        |> String.split("\n", trim: true)
        |> Enum.map(fn elem ->
            [inputs, outputs] = elem
            |> String.split(" | ", trim: true)

            inputs = inputs
            |> String.split(" ", trim: true)

            outputs = outputs
            |> String.split(" ", trim: true)

            [inputs, outputs]
        end)
    end

    # im about to sleep, but this problem
    # is asking to decode 4 numbers based on 10 inputs per line
    # a lot of pattern matching and comparison. little intimidating, but
    # i think i'll pull through.

    #gn my sweet child xqcL

    def part1(input) do
        input
    end
end