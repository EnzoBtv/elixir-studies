# Carrega todos os dados em memória e depois executa
# IO.inspect Enum.map(1..20_000_000, &(&1)) |> Enum.take(10)

# Devolve uma stream de dados que representa a informação contida nela
# Usar apenas quando precisar atrasar o carregamento de informações, precisar de parte de algo maior ou lidar com arquivos mt grandes
# Consome mais recursos que o Enum
# IO.inspect Stream.map(1..20_000_000, &(&1)) |> Enum.take(10)

# {:ok, binary} = File.read("test.txt")

# test = String.split(binary, "\n")
# Enum.each(test, &IO.puts/1)

# or

stream = File.stream!("test.txt")
stream
  |> Enum.each(&IO.puts/1)
