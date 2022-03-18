defmodule Day4 do

    def parse(file_name) do
        [head|tail] = file_name
        |> File.read!
        |> String.split("\n", trim: true)

        # head is the commands, tail is the boards.
        boards = tail # tail is a list of strings
        |> Enum.map(fn x -> String.split(x, " ", trim: true) end)
        |> Enum.chunk_every(5, 5)

        [head |> String.split(",", trim: true), boards]
    end

    defp all_x(li, exception) do
        # [X, X, X, 4, X]
        num_x = li
        |> List.foldl(0, fn elem, acc ->
            if elem == "X" or acc == exception do
                acc + 1
            else
                -5
            end
        end)

       num_x == 5
    end

    defp has_bingo({x, y}, board) do
        # check all on same x axis -- use y
        # check all on same y axis -- use x

        # returns [true, [numbers]] if successful
        # return [false, []]

        success = board
        |> Enum.at(y)
        |> all_x(x)

        if success == true do
            [true, Enum.at(board, y)]
        else
            li = board
            |> List.foldl([], fn elem, li ->
                li ++ [elem]
            end)
            
            if all_x(li, y) == true do
                [true, li]
            else
                [false, []]
            end
        end
    end

    defp contains_number(number, board) do
        # [ - board layout:
        #    [1, 2, 3, 4, 5],
        #    [1, 2, 3, 4, 5],
        #    [1, 2, 3, 4, 5],
        #    [1, 2, 3, 4, 5],
        #    [1, 2, 3, 4, 5]
        # ]

        found = nil


        board = board
        |> Enum.map(fn row ->
            row
            |> Enum.map(fn elem ->
                if elem == number do
                    "X"
                else
                    elem
                end
            end)
        end)

        found = board
        |> List.foldl(0, fn row, y ->
            result = row
            |> List.foldl(0, fn _elem, x ->
                if is_list(y) == false and is_list(x) == false do # keep checking if match not found
                    [success, numbers] = has_bingo({x, y}, board)
                    if success == true do
                        [success, numbers] # replace y
                    else
                        x + 1 # increment X
                    end
                else
                    x
                end
            end)

            cond do
                # if y is already a list, y
                is_list(y) == true ->
                    y
                # if result is a lost, y = result
                is_list(result) == true ->
                    result
                # otherwise
                true ->
                    y + 1
            end
        end)

        if is_list(found) == false, do: [board, false, []], else: [board | found]
    end

    defp call_number([number|remaining], boards) do
        [new_board, success, numbers] = boards
        |> List.foldl([[], false, []], fn board, [b, success, nums] -> 
            if success == false do
                [b2, succ, nums] = contains_number(number, board)
                [[b2|b], succ, nums]
            else
                [b, success, nums]
            end
        end)

        if success == true do
            numbers
        else
            call_number(remaining, new_board)
        end
    end

    def part1([inputs, boards]) do
        call_number(inputs, boards)
    end
end