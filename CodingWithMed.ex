defmodule M do

    defp print_num(9001), do: IO.puts("ITS OVAR 9000")
    defp print_num(n) when rem(n, 2) == 0, do: IO.puts("Divisible by 2")
    defp print_num(_n), do: IO.puts("Not divisible by 2")

    def print("Mederick") do
        print_num(3)
        IO.puts("FUCK YOU!")
    end

    def print(name), do: "Hello " <> name <> "!" |> IO.puts

    def add_list([]), do: 0
    def add_list([head | tail]), do: head + add_list(tail)
end

[1, 2, 3, 4, 5] |> M.add_list |> IO.puts
"Will" |> M.print
