# These are syntatic sugar, so be careful

import IO, only: [puts: 1]
import Integer
list = [1, 2, 3, 4, 5]

for x <- list, do: puts x*x
for {_key, val} <- [one: 1, two: 2, three: 3], do: puts val
for {k, v} <- %{"a" => "A", "b" => "B"}, do: IO.inspect({k, v})
for <<c <- "hello">>, do: <<c>>


for {:ok, val} <- [ok: "Hello", error: "Unknown", ok: "World"], do: puts(val)
for n <- list, times <- 1..n do
  puts(String.duplicate("*", times))
end

for x <- 1..10, is_even(x), do: puts x
for x <- 1..100,
    is_even(x),
    rem(x, 3) == 0, do: puts x

for {k, v} <- [one: 1, two: 2, three: 3], into: %{}, do: IO.inspect({k, v})
for c <- [72, 101, 108, 108, 111], into "", do: <<c>>
