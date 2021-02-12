~c/2 + 7 = #{2+7}/ # Generates char chain
~C/2 + 7 = #{2 + 7}/

re = ~r/elixir/i # Generates Regexo
"Elixir" =~ re
"elixir" =~ re

string = "100_000_000"
Regex.split(~r/_/, string)

~s/the cat in the hat on the mat/ # Generates strings
~s/welcome to elixir #{String.downcase "SCHOOL"}/
~S/welcome to elixir #{String.downcase "SCHOOL"}/


~w/i love exs school/ # Generates Word list
~W/i love esx school/

~w/i love #{'e'}lixir school/
~W/i love #{'e'}lixir school/
NaiveDateTime.from_iso8601("2015-01-23 23:50:07")
#{:ok, ~N[2015-01-23 23:50:07]}

defmodule MySigils do
  def sigil_u(string, []), do: String.upcase(string)
end

import MySigils
~u/test/ # uppercase
