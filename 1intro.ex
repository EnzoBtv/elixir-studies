IO.puts(2 + 3 == 5)

String.length("test")

name = "Test"
"hello #{name}"
"Hello " <> name

x = ["test", :hello]
["oi" | x]
x ++ [:oi]

# map
map = %{:hello => "world"}
map[:hello]

map = %{map | :hello => "heaven"}
IO.inspect(map)
Map.put(map, :bye, "world")

# key value list
a = [hello: "world"]
a[:hello]

map = %{:foo => "bar", "hello" => :world}
map.foo
