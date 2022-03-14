
# has a pretty standard string library
# div(5, 4) divides integer, so 5/4 = 1
# rem(5, 4) is modulus op, so 5 % 4 = 1

# ==, != compares value
# ===, !== compares data type AND value


defmodule M do
  def ternary do
    name = "WeirdChamp"
    IO.puts("Ternary: #{ name == "foshes" && "God programmer" || "WeirdChamp"}")
  end
end

M.ternary()