defmodule Day4 do

    def parse(file_name) do
        [head|tail] = file_name
        |> File.read!
        |> String.split("\n", trim: true)

        # head is the commands, tail is the boards.
        boards = tail # tail is a list of strings
        |> Enum.map(fn x ->
            x
            |> String.split(" ", trim: true)
        end)
        |> Enum.chunk_every(5, 5)

        [head |> String.split(",", trim: true), boards]
    end

    defp valid_bingo(li, seen) do
        num_elems = li # counts number of elements that have been seen
        |> List.foldl(0, fn elem, acc ->
            if Enum.member?(seen, elem) == true, do: acc + 1, else: acc
        end)

        # if all 5 elements are in seen, we found bingo
        num_elems == 5
    end

    defp transpose(rows) do
        rows
        |> List.zip
        |> Enum.map(&Tuple.to_list/1)
    end

    defp check_for_bingo(board, seen) do
        # checking rows
        bingo = board
        |> List.foldl([], fn row, y ->
            cond do
                Enum.count(y) == 5 -> y # found bingo already
                valid_bingo(row, seen) == true -> row # if we found bingo, set acc to current row
                true -> y
            end
        end)

        # checking PogO column XD
        if Enum.count(bingo) == 5 do
            board
        else
            # figure out how to loop through columns
            success = board
            |> transpose
            |> List.foldl([], fn row, y ->
                cond do
                    Enum.count(y) == 5 -> y # found bingo already
                    valid_bingo(row, seen) == true -> row # if we found bingo, set acc to current row
                    true -> y
                end
            end)

            if Enum.count(success) == 5, do: board, else: []
        end
    end

    defp check_boards(boards, seen) do
      # loop through each board
      # at each position {x, y}, check for bingo (horizontally/vertically)
      boards
      |> List.foldl([], fn board, bingo ->
        if Enum.count(bingo) == 5 do # dont touch if we found bingo :D
            bingo
        else
            check_for_bingo(board, seen)
        end
      end)
    end

    defp remove_bingos(boards, seen) do
        boards
        |> List.foldl([], fn board, new_boards ->
            bingo = check_for_bingo(board, seen)
            if Enum.count(bingo) == 0 do
                [board|new_boards]
            else
                new_boards
            end
        end)
    end

    defp call_numbers(inputs, [board], seen, _part2), do: call_numbers(inputs, [board], seen)
    defp call_numbers([head|tail], boards, seen, _part2) do
        # check each board for bingo based on seen.
        # cannot have a bingo if seen is less than 5
        call_numbers(
            tail,
            remove_bingos(boards, [head|seen]),
            [head|seen],
            true
        )
    end
    defp call_numbers([head|tail], boards, seen) do
        # check each board for bingo based on seen.
        # cannot have a bingo if seen is less than 5
        if Enum.count(seen) < 5 do
            call_numbers(tail, boards, [head|seen])
        else
            # next, check each board if it has a bingo
            numbers = boards # [1, 2, 3, 4, 5]
            |> check_boards([head|seen])

            if Enum.count(numbers) == 5 do
                [numbers, [head|seen]]
            else
                call_numbers(tail, boards, [head|seen])
            end
        end
    end

    defp find_sum_unseen(li, seen) do
        li
        |> List.foldl(0, fn row, acc ->
            val = row
            |> Enum.map(fn x ->
                # if seen, set to 0
                if Enum.member?(seen, x) == true do
                    0
                else #otherwise, set to element value
                    {elem, _} = Integer.parse(x)
                    elem
                end
            end)
            |> Enum.sum()

            acc + val
        end)
    end

    def part1([inputs, boards]) do

        # head = 1, tail = [2, 3, ...]

        # [1,2,3,4,5,6,7,8, ...]

        # [ - board layout:
        #    [1, 2, 3, 4, 5],
        #    [1, 2, 3, 4, 5],
        #    [1, 2, 3, 4, 5],
        #    [1, 2, 3, 4, 5],
        #    [1, 2, 3, 4, 5]
        # ]

        [winning_board, seen] = call_numbers(inputs, boards, [])
        {last_called, _} = Integer.parse(List.first(seen))
        find_sum_unseen(winning_board, seen) * last_called
    end

    def part2([inputs, boards]) do
        [winning_board, seen] = call_numbers(inputs, boards, [], true)
        {last_called, _} = Integer.parse(List.first(seen))
        find_sum_unseen(winning_board, seen) * last_called
    end
end
