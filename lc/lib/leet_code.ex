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

