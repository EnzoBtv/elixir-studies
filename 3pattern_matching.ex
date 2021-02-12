# Pattern matching é uma poderosa parte de Elixir que nos permite procurar padrões simples em valores, estruturas de dados, e até funções

# MATCH OPERATOR
x = 2 # ok
2 = x # ok
# 1 = x err

# PIN OPERATOR
y = 1 # ok
# ^y = 2 # err
{y, ^y} = {2, 1}

key = "hello" # ok

%{^key => value} = %{"hello" => "world"} #ok
value#ok

# %{^key => value} = %{:hello => "world"} #(MatchError) no match of right hand side value: %{hello: "world"}


# PIN EX:
greeting = "Hello"
greet = fn
  (^greeting, name) -> "Hi, #{name}"
  (greeting, name) -> "Mornin, #{name}"
end

IO.puts(greet.("Hello", "Enzo"))
IO.puts(greet.("Hey", "Enzo"))
