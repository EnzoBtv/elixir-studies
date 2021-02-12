defmodule ExecutablesTest do
  use ExUnit.Case
  doctest Executables

  test "greets the world" do
    assert Executables.hello() == :world
  end
end
