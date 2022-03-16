# if you're reading this, i promise i'm not a sweat. i just crave
# any extra problems that i can find an leetcode is like a hub for bs
# problems that you'll never find in the workplace

# buuut if you're a recruiter, i LOOOOVE leetcode!

defmodule Solution do
    defp check([{head, i} | _tail], target, map) when is_map_key(map, target - head) do
        [map[target - head], i]
    end

    defp check([{head, i} | tail], target, map) do
        check(tail, target, Map.put(map, head, i))
    end

    def two_sum(nums, target) do
        nums
        |> Enum.with_index
        |> check(target, %{})
    end

    def is_palindrome(x) do
        s = Integer.to_string(x)
        s == String.reverse(s)
    end
end
