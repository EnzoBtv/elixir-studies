defmodule SimpleQueue.Application do
  use Application

  def start(_type, _args) do
    children = [
      {SimpleQueue, [1, 2, 3]}
    ]

    opts = [strategy: :one_for_one, name: SimpleQueue.Supervisor]
    Supervisor.start_link(children, opts)

    # Used for web applications when we want to predict the connection an an user in our website and we need to create new connections on demand
    # DynamicSupervisor.start_link(children, opts)
    # DynamicSupervisor.start_child(SimpleQueue.Supervisor, SimpleQueue)

    # children2 = [
    #   {Task.Supervisor, name: SimpleQueue, restart: :transient}
    # ]
    # {:ok, pid} = Supervisor.start_link(children2, strategy: :one_for_one)
    # {:ok, pid} = Task.Supervisor.start_child(SimpleQueue, fn -> background_work end)
  end
end
