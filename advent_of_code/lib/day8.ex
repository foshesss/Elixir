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

    # im about to sleep, but this problem
    # is asking to decode 4 numbers based on 10 inputs per line
    # a lot of pattern matching and comparison. little intimidating, but
    # i think i'll pull through.

    #gn my sweet child xqcL

    # okayyyy so....
    # we have 7 potential options, [a,b,c,d,e,f,g]
    # each option can be tangled in some order. example: [b,c,a,d,f,g,e]

    # it is our job to untangle and figure out the values of each
    # item in the tangle

    # options with 2 letters:
        # 1, two on the left
    
    # options with 3 letters:
        # 7, two on the left and one on top

    # options with 4 letters:
        # 4, 2 on the left, one in the middle, one on the top left

    # options with 5 letters:
        # 2, one on top, one on top right, one in middle, 

    # figure out one letter at a time.

    # for a, we check every input. 
        # if the length of an input is 2, we know that it's on the right
        # if it's 3, we know it's either top of on the right
        # if it's 4, we know middle, top left, or right <- if it doesn't flag 2 and 3, 
            # we know by process of elimination it's either top left or middle
    

    # first check for all strings of length 2.
        # if there are any, we know the right letters
    
    # next check for all strings of length 3.
        # if there were length two strings, we now know the top letter
        # otherwise, we know the top and right letters
    
    # next, we check for strings of length 4.
        # if we have either a length 2 or length 3 string, we can quickly
            # deduce what the middle/top left letters are.
        # otherwise, we know what the right side/middle/top left are.
    
    # next we compare both length 6s.
        # missing ones are either bottom left or middle

    # AHHHH THIS IS SO TOUGH


    # OH MY GOD I JUST REALIZED ALL INPUTS REPRESENT 1 OF
    # EACH NUMBER, SO WE CAN ASSUME ONE OCCURENCE OF EACH. BLESS!

    # defp unscramble([input, outputs]) do

    # end

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

    defp unscramble(input, map) do
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