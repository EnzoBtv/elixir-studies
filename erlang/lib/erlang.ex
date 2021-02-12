defmodule Erlang do
  def testPng do
    png = :png.create(%{:size => {30, 30}, :mode => {:indexed, 8}, :file => file, :palette => paletteie})
  end
end
