defmodule HelloPhoenixWeb.TaskController do
  use HelloPhoenixWeb, :controller

  alias HelloPhoenix.Repo
  alias HelloPhoenix.Task

  def index(conn, _params) do
    tasks = Repo.all(Task)
    render(conn, :index, tasks: tasks)
  end

  def new(conn, _params) do
    changeset = Task.changeset(%Task{}, %{})
    render(conn, :new, changeset: changeset, layout: false)
  end

  def create(conn, %{"task" => task_params}) do
    changeset = Task.changeset(%Task{}, task_params)

    case Repo.insert(changeset) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: ~p"/tasks/#{task}")

      {:error, changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Repo.get!(Task, id)
    render(conn, :show, task: task)
  end

  def edit(conn, %{"id" => id}) do
    task = Repo.get!(Task, id)
    changeset = Task.changeset(task, %{})
    render(conn, :edit, task: task, changeset: changeset)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Repo.get!(Task, id)
    changeset = Task.changeset(task, task_params)

    case Repo.update(changeset) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: ~p"/tasks/#{task}")

      {:error, changeset} ->
        render(conn, :edit, task: task, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Repo.get!(Task, id)
    {:ok, _task} = Repo.delete(task)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: ~p"/tasks")
  end
end
