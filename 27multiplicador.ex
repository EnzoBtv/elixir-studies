defmodule Multiplicador do
  def multiplique(a, b \\ 2) do
    soma(10, a * b)
  end

  defp soma(a, b), do: a + b
end

Multiplicador.multiplique(2, 2)
Multiplicador.multiplique(5)


defmodule Multiplicador2 do
  defmodule Multiplique do
    def por_dois(numero) do
      numero * 2
    end
  end
end

defmodule Multiplicador3 do

end

defmodule Multiplicador3.Multiplique do
  def por_dois(numero) do
    IO.puts numero * 2
  end
end
