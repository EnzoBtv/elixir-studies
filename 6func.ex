sum = fn (a, b) -> a + b end
sum.(2, 3)

sub = &(&1 - &2)
sub.(2, 3)


handle_result = fn
  {:ok, result} -> IO.puts "Handling Result #{result}"
  {:ok, _} -> IO.puts "This would be never run as previous will be matched beforehand"
  {:error} -> IO.puts "An error has occurred"
end

some_result = 1
handle_result.({:ok, some_result})
handle_result.({:error})


defmodule Greeter do
  def hello(name) do
    "Hello #{name}"
  end
end

IO.puts(Greeter.hello("test"))

defmodule Greeter2 do
  def hello(name), do: "Hello #{name}"
end

IO.puts(Greeter2.hello("test"))

defmodule Length do
  def of([]), do: 0
  def of([_ | tail]) do
    IO.inspect(tail)
    1 + of(tail)
  end
end

IO.puts(Length.of([]))
IO.puts(Length.of([1, 2, 3]))


defmodule Greeter3 do
  def hello(), do: "Hello, anonymous person!"   # hello/0
  def hello(name), do: "Hello, " <> name        # hello/1
  def hello(name1, name2), do: "Hello, #{name1} and #{name2}" # hello/2
end

Greeter3.hello()
Greeter3.hello("Test")
Greeter3.hello("Test", "Test2")

defmodule Greeter4 do
  def hello(%{name: person_name}) do
    IO.puts "Hello, " <> person_name
  end
end

Greeter4.hello(%{
  name: "Fred",
  age: 95,
  favorite_color: "red"
})

defmodule Greeter5 do
  def hello(%{name: person_name} = person) do
    IO.puts "Hello, " <> person_name
    IO.inspect person
  end
end

Greeter5.hello(%{
  name: "Fred",
  age: 95,
  favorite_color: "red"
})

defmodule Greeter6 do
  def hello(name), do: "#{phrase()} #{name}"
  defp phrase(), do: "Hello, "
end

defmodule Greeter7 do
  def hello(names, language_code \\ "en")

  def hello(names, language_code) when is_list(names) do
    names
    |> Enum.join(", ")
    |> hello language_code
  end

  def hello(name, language_code) when is_binary(name) do
      IO.puts(phrase(language_code) <> name)
  end

  defp phrase("en"), do: "Hello, "
  defp phrase("pt"), do: "Olá, "
end

Greeter7.hello(["John", "Steve"])

defmodule Greeter8 do
  def hello(name, language_code \\ "en") do
    IO.puts(phrase(language_code) <> name)
  end

  defp phrase("en"), do: "Hello, "
  defp phrase("pt"), do: "Olá, "
end

Greeter8.hello("Steve")
Greeter8.hello("Steve", "pt")
Greeter8.hello("Steve", "en")
