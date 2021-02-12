raise "Oh no!"

raise ArgumentError, message: "invalid argument value"

try do
    raise "Oh no!"
rescue
    e in RuntimeError -> IO.puts("An error occurred #{e.message}")
end

try do
    opts
    |> Keyword.fetch!(:source_file)
    |> File.read!()
rescue
    e in KeyError -> IO.puts("Missing :source_file option")
    e in File.error -> IO.puts("unable to read source file")
end

try do
    raise "Oh no!"
rescue
    e in RuntimeError -> IO.puts("An error occurred #{e.message}")
after
    IO.puts("The end!")
end

{:ok, file} = File.open("example.json")

try do
after
    File.close()
end

defmodule ExampleError do
    defexception message: "an example error has ocurred"
end

try do
    raise ExampleError
rescue
    e in ExampleError -> e
end

try do
    for x <- 0..10 do
        if x == 5, do: throw(x)
        IO.puts(x)
    end
catch
    x -> "Caught #{x}"
end


spawn_link fn -> exit("oh no") end

try do
    exit "oh no!"
catch
    :exit, _ -> "exit blocked"
end
