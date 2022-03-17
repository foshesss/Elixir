# Elixir

This repository is going to be used to track my progress in Elixir. As I've been job hunting, I've noticed that a pretty niche skill to have is Elixir and I'd love to set myself up as a potentially very strong candidate, having experience with a functional programming language that isn't Ocaml.

How I've been learning is through YouTube, the [Advent of Code 2021](https://adventofcode.com/2021), and reading the [Elixir documentation](https://hexdocs.pm/elixir/Kernel.html). On top of that, as you might've noticed by some file naming, I am learning with one of my friends, Mederick. 

## Roadblocks
This section will be used to show where I struggle, and following will be a chunk of code in which I overcome the struggle or 'roadblock'.
### Roadblock #1
(3/15/22) One-lined functions and pattern matching:
```elixir
defmodule example do
  def fib(0), do: 0
  def fib(1), do: 0
  def fib(n) when n >= 2, do: fib(n - 2) + fib(n - 1)
end
```

### Roadblock #2
(3/16/22) Soo today has been pretty alright, but it's so difficult to code without looping constructs. For the advent of code, I had to find the frequency of 1s and 0s in a bit string and that so such a pain. HOWEVER, with determination and the realization that List/Enum functions are my best friend, I figured it out:
```elixir
  defp get_most_frequent([], output), do: output
  defp get_most_frequent([head|tail], li) do
    output = head
    |> List.foldl(li, fn {elem, index}, acc ->
      if elem == "1" do
        List.update_at(acc, index, &(&1 + 1)) # add one to our output list if we find a one
      else
        acc # return output list how it was
      end
    end)

    tail
    |> get_most_frequent(output) # recursion Pog
  end

  def parse(file_name) do
    file_name
    |> File.read!
    |> String.split("\n")
    |> Enum.map(fn x -> x |> String.split("", trim: true) |> Enum.with_index end)

    # set our input up like this:
    # [
    #  [[1, 0], [0, 1], [1, 2], [1, 3], [1, 4]],
    #  [[1, 0], [1, 1], [0, 2], [0, 3], [1, 4]]
    # ]
    # {element, index}
  end
```
I'll likely continue updating my roadblocks section as I learn, so I can look back and laugh at how simple my mistakes were.

## Helpful YouTube videos
https://www.youtube.com/watch?v=a-off4Vznjs

https://www.youtube.com/watch?v=pBNOavRoNL0
