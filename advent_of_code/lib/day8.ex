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
            |> Enum.sort_by(&String.length/1)

            outputs = outputs
            |> String.split(" ", trim: true)

            [inputs, outputs]
        end)
    end

    base_map = %{
        # 1 indicates it appears in this number, 0 indicates it does not
        [1, 0, 1, 1, 0, 1, 1, 1, 1, 1] => 'a', # index corresponds to number
        [1, 0, 0, 0, 1, 1, 1, 0, 1, 1] => 'b',
        [1, 1, 1, 1, 1, 0, 0, 1, 1, 1] => 'c',
        [0, 0, 1, 1, 1, 1, 1, 0, 1, 1] => 'd',
        [1, 0, 1, 0, 0, 0, 1, 0, 1, 0] => 'e',
        [1, 1, 0, 1, 1, 1, 1, 1, 1, 1] => 'f',
        [1, 0, 0, 1, 0, 1, 1, 0, 1, 1] => 'g'
    }

    # loop through all inputs, fill in a new map
    # 

    defp find_values(input) do
        input
        |> List.foldl(0, fn [_inputs, outputs], acc ->
            num = outputs
            |> Enum.count(fn x ->
                len = x
                |> String.length

                len == 2 or len == 3 or len == 4 or len == 7
            end)
            num + acc
        end)
    end

    defp unscramble(_input, _map) do
        # input is a string "abcde"
        # map is the mapping [a, b, c, d, e, f, g]
        # each map will be different, but this will help determine what is what.

        # [1, 1, 1, 0, 1, 1, 1] is a 0
        # [0, 1, 0, 0, 0, 1, 0] is a 1, so on

        # damn dude, i gotta be honest. no idea how i'm gonna pull this off.




        5
    end

    def part1(input) do
        input
        |> find_values
    end

    def part2(input) do
        input
        |> unscramble([])
    end
end