colecao = [1, 2, 3]

IO.inspect(
  Enum.map(colecao, &(&1 * 2))
  |> Enum.map(&(&1 * 2))
  |> Enum.map(&(&1 * 2))
)

itens = [
  %{produto: "Tv LG 32 polegadas", valor: 935.50},
  %{produto: "Notebook Samsung 1TB", valor: 1599.00},
  %{produto: "Barbeador Gilette", valor: 9.99}
]

IO.inspect itens
  |> Enum.map(&(&1.valor * 0.8))
  |> Enum.filter(&(&1 > 10.00))
  |> Enum.sum()
