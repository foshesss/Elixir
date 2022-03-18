defmodule Day4 do

    def parse(file_name) do
        [head|tail] = file_name
        |> File.read!
        |> String.split("\n", trim: true)

        # head is the commands, tail is the boards.
        boards = tail # tail is a list of strings
        |> Enum.map(fn x -> String.split(x, " ", trim: true) end)
        |> Enum.chunk_every(5, 5)

        [head, boards]
    end

    defp has_bingo({x, y}, board) do
        # check all on same x axis -- use y
        # check all on same y axis -- use x

        # returns [true, [numbers]] if successful
        # return [false, []]
    end

    defp contains_number(number, board) do
        # [ - board layout:
        #    [1, 2, 3, 4, 5],
        #    [1, 2, 3, 4, 5],
        #    [1, 2, 3, 4, 5],
        #    [1, 2, 3, 4, 5],
        #    [1, 2, 3, 4, 5]
        # ]

        # AHHH HOW DO I KEEP TRACK OF INDEX ?!?!

        # replace each occurences with an X
        # if occurence is found, check has_bingo with {x, y} position
            # [success, numbers] = has_bingo({x, y}, board)
            # if success == true:
            #   [true, numbers]
            # else
            #   continue (?)
            # end
        # return [false, {}] -- assumption that has_bingo was unsuccessful for this board
    end

    defp call_number([number|remaining], boards) do
        [success, numbers]= boards
        |> List.foldl([false, []], fn board, [success, _numbers] -> 
            if success == false do
                acc = contains_number(number, board)
            else
                acc
            end
        end)

        if success == true do
            numbers
        else
            call_number(remaining, boards)
        end
    end

    def part1([inputs, boards]) do
        IO.puts("yo")
        5
    end
end