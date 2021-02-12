quote do: 42
quote do: "Hello"
quote do: :world
quote do: 1 + 2

defmodule Calc do
  def divide(a, b) do
    a / b
  end
end

denominator = 2
quote do: Calc.divide(42,denominator)
quote do: Calc.divide(42, unquote(denominator))

defmodule OurMacro do
  defmacro unless(expr, do: block) do
    quote do
      if !unquote(expr), do: unquote(block)
    end
  end
end


defmodule Logger do
  defmacro log(msg) do
    if Application.get_env(:logger, :enabled) do
      quote do
        IO.puts("Logged message: #{unquote(msg)}")
      end
    end
  end
end

defmodule Example do
  require Logger

  def test do
    Logger.log("This is a log message")
  end
end


Macro.to_string(quote(do: foo.bar(1, 2, 3))) # Used to understand macros

# require OurMacro

# quoted =
#   quote do
#     OurMacro.unless(true, do: "Hi")
#   end
# quoted |> Macro.expand_once(__ENV__) |> Macro.to_string |> IO.puts
# quoted |> Macro.expand(__ENV__) |> Macro.to_string |> IO.puts

defmodule Example do
  defmacro hygienic do
    quote do: val = -1
  end

  defmacro unhygienic do
    quote do: var!(val) = -1
  end

  defmacro double_puts(expr) do
    quote do
      IO.puts(unquote(expr))
      IO.puts(unquote(expr))
    end
  end

  defmacro double_puts2(expr) do
    quote bind_quoted: [expr: expr] do
      IO.puts(expr)
      IO.puts(expr)
    end
  end
end

Example.double_puts :os.system_time # Prints two diff hours
Example.double_puts2 :os.system_time # Prints one hour, two times
