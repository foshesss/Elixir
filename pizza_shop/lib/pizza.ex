# Resources used for this module:
# https://hexdocs.pm/elixir/1.12/Enum.html

# @ is a module attribute

defmodule Pizza do
    @brands MapSet.new([:pizza_hut, :dominos])
    @types MapSet.new([:pepperoni, :cheese])

    def order(%{brand: brand, type: type}), do: MapSet.member?(@brands, brand) and MapSet.member?(@types, type)
    def order(_params), do: false

    def order_pizzas(li) do
      li
      |> Enum.count(fn x -> order(x) end) # counts for every truthy-value
    end

    # impossible to modify an attributes after compilation :(
    # Source: https://stackoverflow.com/questions/31862889/elixir-modifying-value-of-module-attribute
    
    # def add_brand(brand) when is_atom(brand) == true do
    #   IO.puts(brand)
    #   IO.puts(MapSet.member?(@brands, brand))

    #   IO.puts(MapSet.to_list(@brands))

    #   if MapSet.member?(@brands, brand) == false do
    #     @brands |> MapSet.put(brand)
    #     true
    #   else
    #     false
    #   end
    # end

    # def add_brand(_brand), do: false

end


