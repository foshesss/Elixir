defmodule DailyTests do
  use ExUnit.Case
  @moduletag timeout: :infinity

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
    test_input = Day4.parse("test/Input/Day4TestInput.txt")
    input = Day4.parse("test/Input/Day4Input.txt")

    assert Day4.part1(test_input) == 4512

    IO.puts("Day4Part1 Answer: #{Day4.part1(input)}")

    assert Day4.part2(test_input) == 1924

    IO.puts("Day4Part2 Answer: #{Day4.part2(input)}")
  end

  doctest Day5

  test "day5_answer" do
    test_input = Day5.parse("test/Input/Day5TestInput.txt", true)
    input = Day5.parse("test/Input/Day5Input.txt", true)

    assert Day5.part1(test_input) == 5

    IO.puts("Day5Part1 Answer: #{Day5.part1(input)}")

    test_input = Day5.parse("test/Input/Day5TestInput.txt", false)
    input = Day5.parse("test/Input/Day5Input.txt", false)

    assert Day5.part2(test_input) == 12

    IO.puts("Day5Part2 Answer: #{Day5.part2(input)}")
  end

  doctest Day6

  test "day6_answer" do
    test_input = Day6.parse("test/Input/Day6TestInput.txt")
    input = Day6.parse("test/Input/Day6Input.txt")

    assert Day6.part1(test_input) == 5934

    IO.puts("Day6Part1 Answer: #{Day6.part1(input)}")
  end
end
