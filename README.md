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
I'll likely continue updating my roadblocks section as I learn, so I can look back and laugh at how simple my mistakes were.

## Helpful YouTube videos
https://www.youtube.com/watch?v=a-off4Vznjs

https://www.youtube.com/watch?v=pBNOavRoNL0
