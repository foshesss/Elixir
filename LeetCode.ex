defmodule Solution do
    defp check([head|tail], target, map, pos) when is_map_key(map, target - head) do
        [map[target - h], pos]
    end

    defp check([head|tail], target, map, pos) do
        check(tail, target, Map.put(map, h, pos), pos + 1)
    end

    def two_sum(nums, target)
        check(nums, target, %{}, 0)
    end
end

