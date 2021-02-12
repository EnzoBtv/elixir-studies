import Integer

if String.valid?("Hello") do
  "Valid String!"
else
  "Invalid String!"
end

if "A valid string" do
  "Valid"
end

unless is_integer("hello") do
  "Not integer!"
end

case {:ok, "Hello"} do
  {:ok, "Hello"} -> "result"
  {:error} -> "Ops"
  _ -> "Catch All"
end

case :even do
  :odd -> "Odd"
  _ -> "Not Odd"
end


pie = 3.14
case "cherry_pie" do
  ^pie -> "Not tasty"
  pie -> "I bet #{pie} is tasty"
end

case {1, 2, 3} do
  {1, x, 3} when x > 0 -> "Match"
  _ -> "No Match"
end

cond do
  2 + 2 == 5 -> "No"
  2 * 2 == 3 -> "No NO"
  1 + 1 == 2 -> "Yeah"
end

cond do
  7 + 1 == 0 -> "Incorrect"
  true -> "Catch all"
end

user = %{first: "Sean", last: "Callan"}
with {:ok, first} <- Map.fetch(user, :first),
     {:ok, last} <- Map.fetch(user, :last),
     do:
       IO.puts("#{last}, #{first}")


user = %{first: "doomspork"}
with {:ok, first} <- Map.fetch(user, :first),
     {:ok, last} <- Map.fetch(user, :last),
     do:
      IO.puts(last <> ", " <> first)

m = %{c: 2}

a = with {:ok, number} <- Map.fetch(m, :c),
         true <- is_even(number)
         do
          IO.puts("#{number} divided by 2 is #{div(number, 2)}")
          :even
    else
      :error ->
        IO.puts("We don't have this item in map")
        :error
      _ ->
        IO.puts("It is odd")
        :odd
    end
