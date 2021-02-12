defmodule Greeter do
  @moduledoc """
  Provides a function hello/1 to greet a human
  """

  @doc """
  Prints a hello message

  ## Parameters

    - name: String that represents the name of the person.

  ## Examples

    iex> Greeter.hello("Sean")
    "Hello, Sean"

    iex> Greeter.hello("pete")
    "Hello, Pete"

  """
  @spec hello(String.t()) :: String.t()
  def hello(name) do
    "Hello, #{name}"
  end
end
#h Greeter # to access docs
