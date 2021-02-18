defmodule Contador do
  def contar([]), do: 0
  def contar([_ | tail]), do: 1 + contar(tail)
end

IO.puts Contador.contar([1, 2, 3])
IO.puts Contador.contar(%{"test" => "test"})
