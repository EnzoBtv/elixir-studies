{:carro, modelo} = {:carro, "Honda"}

# Erro: {:carro, modelo} = {:moto, "Honda"}
IO.puts modelo


{_, numero} = {"nao interessa", 500}
IO.puts numero

{_, numero2} = {"nao interessa", "Também não interessa", 600}
IO.puts numero2

[a, b] = [1, 2]
IO.puts a + b

[a, b] = [3, 4]
IO.puts a + b

# Erro: [^a, b] = [5, 6] ** (MatchError) no match of right hand side value: [5, 6]

[^a, b] = [3, 6]
IO.puts a + b


escreva_o_nome = fn
  :enzo -> "Seu nome é Enzo"
  :erika -> "Seu nome é Erika"
  _ -> "Seu nome não é importante para este programa"

escreva_o_nome.(:enzo)
escreva_o_nome.(:erika)
escreva_o_nome.(:teste)
