defmodule Example do
  def add(a, b) do
    IO.puts(a + b)
  end

  def listen do
    receive do
      {:ok, "hello"} -> IO.puts("World")
    end

    listen()
  end

  def explode, do: exit(:kaboom)

  def run do
    Process.flag(:trap_exit, true)
    spawn_link(Example, :explode, [])

    receive do
      {:EXIT, _from_pid, reason} -> IO.puts("Exit reason: #{reason}")
    end
  end

  def run2 do
    {pid, ref} = spawn_monitor(Example, :explode, [])

    receive do
      {:DOWN, _ref, :process, _from_pid, reason} -> IO.puts("Exit reason: #{reason}")
    end
  end

  def double(x) do
    :timer.sleep(2000)
    x*2
  end
end

spawn(Example, :add, [1, 2])

pid = spawn(Example, :listen, [])
send(pid, {:ok, "hello"})

send(pid, :ok)

spawn(Example, :explode, [])
spawn_link(Example, :explode, [])

Example.run
Example.run2


{:ok, agent} = Agent.start_link(fn -> [1, 2, 3] end)

Agent.update(agent, fn state -> state ++ [4, 5] end)

Agent.get(agent, &(IO.inspect(&1)))


Agent.start_link(fn -> [1, 2, 3] end, name: Numbers)
Agent.get(Numbers, &(IO.inspect(&1)))

task = Task.async(Example, :double, [2000])

IO.inspect(Task.await(task))
