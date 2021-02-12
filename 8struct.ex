import List, only: [last: 1] # , except: [first: 1]

# import List, only: :functions
# import List, only: :macros

defmodule Example do
  @greeting "Hello"

  def greeting(name) do
    "Hello #{name}"
  end
end


defmodule Example.Greetings do
  def morning(name) do
    "Good Morning #{name}"
  end

  def evening(name) do
    "Good night #{name}"
  end
end

defmodule Example.User do
  @derive {Inspect, only: [:name]} # Inspect will only return name
  defstruct name: "Sean", roles: []
end

Example.greeting("sean")

Example.Greetings.morning("Enzo")

# %Example.User{}
# %Example.User{name: "Steve", roles: [:manager]}
# steve = %Example.User{name: "Steve"}
# sean = %{steve | name: "Sean"}

# %{name: "Sean"} = sean

defmodule Sayings.Greetings do
  def basic(name), do: "Hi, #{name}"
end

defmodule Sayings.Farewells do
  def basic(name), do: "Bye, #{name}"
end

# With alias
defmodule Example2 do
  alias Sayings.Greetings

  def greeting(name), do: Greetings.basic(name)
end

defmodule Example3 do
  # require SuperMacros
  def greeting(name), do: Sayings.Greetings.basic(name)
end

# pseudonym to alias in case of double name or nickname
defmodule Example4 do
  alias Sayings.Greetings, as: Hi

  def print_message(name), do: Hi.basic(name)
end

defmodule Example5 do
  alias Sayings.{Greetings, Farewells}
end

#if we want to import functions instead of creating pseudonyms to a module we can use import keyword as is defined in the beginning of this file
last([1, 2, 3])

defmodule Hello do
  defmacro __using__(_opts) do
    quote do
      def hello(name), do: "Hi, #{name}"
    end
  end
end

defmodule Example6 do
  use Hello
end

Example6.hello("test")

defmodule Hello2 do
  defmacro __using__(opts) do
    IO.inspect(opts)
    greeting = Keyword.get(opts, :greeting, "Hi")
    quote do
      def hello(name), do: "#{unquote(greeting)}, #{name}"
    end
  end
end

defmodule Example7 do
  use Hello2, greeting: "Hola"
end
