defmodule LeetCodeTest do
  use ExUnit.Case
  doctest Solution

  test "two_sum" do
    assert Solution.two_sum([2,7,11,15], 9) == [0, 1]
    assert Solution.two_sum([3, 2, 4], 6) == [1, 2]
    assert Solution.two_sum([3, 3], 6) == [0, 1]
  end

  test "is_palindrome" do
    assert Solution.is_palindrome(140000) == false
    assert Solution.is_palindrome(90001) == false
    assert Solution.is_palindrome(10101) == true
    assert Solution.is_palindrome(-151) == false
  end
end
