defmodule HelloPhoenixWeb.PageController do
  use HelloPhoenixWeb, :controller

  alias HelloPhoenix.Repo
  alias HelloPhoenix.Task

  def home(conn, _params) do
    tasks = Repo.all(Task)
    render(conn, :home, tasks: tasks)
  end
end
