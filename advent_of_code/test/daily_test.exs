defmodule DailyTests do
  use ExUnit.Case
  doctest Day1

  test "day1_answer" do
    input = Day1.parse("test/Input/Day1Input.txt")

    assert Day1.part1([199,200,208,210,200,207,240,269,260,263]) == 7
    IO.puts("Day1Part1 Answer: #{Day1.part1(input)}")

    assert Day1.part2([199,200,208,210,200,207,240,269,260,263]) == 5
    IO.puts("Day1Part2 Answer: #{Day1.part2(input)}")
  end

  doctest Day2

  test "day2_answer" do
    test_input = Day2.parse("test/Input/Day2TestInput.txt")
    input = Day2.parse("test/Input/Day2Input.txt")

    assert Day2.part1(test_input) == 150
    IO.puts("Day2Part1 Answer: #{Day2.part1(input)}")

    assert Day2.part2(test_input) == 900
    IO.puts("Day2Part2 Answer: #{Day2.part2(input)}")
  end

  doctest Day3

  test "day3_answer" do
    test_input = Day3.parse("test/Input/Day3TestInput.txt")
    input = Day3.parse("test/Input/Day3Input.txt")

    assert Day3.part1(test_input) == 198
    IO.puts("Day3Part1 Answer: #{Day3.part1(input)}")

    assert Day3.part2(test_input) == 230
    IO.puts("Day3Part2 Answer: #{Day3.part2(input)}")
  end

  doctest Day4

  test "day4_answer" do
    input = Day4.parse("test/Input/Day4Input.txt")

    IO.puts("Day4Part1 Answer: #{Day4.part1(input)}")
  end
end
