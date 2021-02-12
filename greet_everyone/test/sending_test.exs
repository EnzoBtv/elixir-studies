defmodule SendingTest do
  use ExUnit.Case

  test "Receives ping" do
    SendingProcess.run(self())
    assert_received :ping
  end
end
