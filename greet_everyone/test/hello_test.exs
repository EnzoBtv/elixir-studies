defmodule HelloTest do
  use ExUnit.Case

  setup_all do
    {:ok, recipient: :world}
  end

  test "greets the world", state do
    assert Example.hello() == state[:recipient]
    refute Example.hello() == :word
  end
end
