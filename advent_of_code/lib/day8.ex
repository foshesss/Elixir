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

    defp 

    defp unscramble([inputs, outputs]) do

    # base_map has a key, which is an array.
    # array index 0 represents elements with 2 characters
    # index 1 -> 3 characters
    # so on until index 5, which represents 7 characters (the max)

    # each array represents amount of times the letter is seen in a normal
    # scenario

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


        # input is a string "abcde"
        # map is the mapping [a, b, c, d, e, f, g]
        # each map will be different, but this will help determine what is what.

        # [1, 1, 1, 0, 1, 1, 1] is a 0
        # [0, 1, 0, 0, 0, 1, 0] is a 1, so on

        # damn dude, i gotta be honest. no idea how i'm gonna pull this off.

        base = List.foldl(%{}, fn elem, map ->

        end) # now to map... maaan.

        # NEVERMIND!

        # base will end up looking like
        # { 'a' = some_array}
        # map 'a' = 'f', etc using base_map
        # replace each output with a list containing replacements (in alphabetical order)
        # return numbers based on a pre-determined map.

        {ret, _} = output
        |> Enum.map(fn str ->
            str
            |> String.to_charlist
            |> List.foldr([], fn char, acc ->
                [base_map[base[char]]|acc]
            end) # create a char list with map representation
        end)
        |> Enum.map(fn elem -> # elem is that list we just created
            numbers[elem]
        end) # retrieve number we created with elem
        |> List.to_string # convert list ["1", "2", "3", "4"] -> "1234"
        |> Integer.parse # "1234" -> 1234

        ret # return answer
    end

    def part1(input) do
        input
        |> find_values
    end

    def part2(input) do
        input
        |> Enum.map(fn elem ->
            elem
            |> unscramble # returns a number (0000-9999)
        end)
        |> Enum.sum # finds sum of numbers
    end
end