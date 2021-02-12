Enum.map([1,2,3], &(&1 + 3))

plus_four = &(&1 + 4)
Enum.map([1,2,3], plus_four)

defmodule Adding do
  def plus_three(number), do: number + 3
end

Enum.map([1,2,3], fn number -> Adding.plus_three(number) end)
Enum.map([1,2,3], &Adding.plus_three(&1))
Enum.map([1,2,3], &Adding.plus_three/1)
