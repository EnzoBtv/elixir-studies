# strings are nothing more than a sequence of bytes in elixir
# Using <<>> shows the compiler that we are speaking about bytes
string = <<104, 101, 108, 108, 111>>
string <> <<0>> # Concatanating string with Byte 0, we can see the byte formation of it

String.length "Hello"
String.replace("Hello", "e", "a")
String.duplicate("Oh my ", 3)
String.split("Hello World", " ")


defmodule Anagram do
  def anagrams?(a, b) when is_binary(a) and is_binary(b) do
    sort_string(a) == sort_string(b)
  end

  def sort_string(string) do
    string
    |> String.downcase()
    |> String.graphemes()
    |> Enum.sort()
  end
end
