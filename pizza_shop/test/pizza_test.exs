defmodule PizzaTest do
  use ExUnit.Case
  doctest Pizza

  test "successful_orders" do
    # couple different combinations
    assert Pizza.order(%{brand: :dominos, type: :pepperoni})
    assert Pizza.order(%{brand: :dominos, type: :cheese})
    assert Pizza.order(%{brand: :pizza_hut, type: :cheese})

    # same map, diff format
    assert Pizza.order(%{type: :cheese, brand: :dominos})
  end

  test "unsuccessful_orders" do
    # cannot provide a string as an argument
    assert Pizza.order("PogChamp") == false

    # :cheeze is not a valid type
    assert Pizza.order(%{brand: :dominos, type: :cheeze}) == false
  end

  # order_pizzas orders pizzas in mass and will report back how many
  # valid pizzas were ordered
  test "order_pizzas" do
    li = [
      %{brand: :dominos, type: :pepperoni},
      %{type: :cheese, brand: :dominos},
      %{brand: :dominos, type: :cheeze},
      %{brand: :dominos, type: :cheese},
      "I don't want pizza right now."
    ]

    assert Pizza.order_pizzas(li) == 3
    assert Pizza.order_pizzas([]) == 0
  end
end
