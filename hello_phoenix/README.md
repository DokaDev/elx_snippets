# Phoenix Task Manager

A simple task management application built with Elixir and Phoenix Framework.

## Project Setup and Installation

### Prerequisites
- Elixir 1.14 or higher
- Phoenix Framework 1.7.x
- Ecto with SQLite3

### Project Creation

```bash
# Create a new Phoenix project with SQLite3
mix phx.new hello_phoenix --database sqlite3
cd hello_phoenix

# Initialize Git repository
git init
git add .
git commit -m "Initial project setup"
```

## Dependencies

The project uses the following dependencies, defined in `mix.exs`:

```elixir
defp deps do
  [
    {:phoenix, "~> 1.7.10"},
    {:phoenix_ecto, "~> 4.4"},
    {:ecto_sqlite3, "~> 0.15"},
    {:phoenix_html, "~> 3.3"},
    {:phoenix_live_reload, "~> 1.2", only: :dev},
    {:phoenix_live_view, "~> 0.20.2"},
    {:floki, ">= 0.30.0", only: :test},
    {:phoenix_live_dashboard, "~> 0.8.3"},
    {:esbuild, "~> 0.8", runtime: Mix.env() == :dev},
    {:tailwind, "~> 0.2", runtime: Mix.env() == :dev},
    {:swoosh, "~> 1.5"},
    {:finch, "~> 0.13"},
    {:telemetry_metrics, "~> 0.6"},
    {:telemetry_poller, "~> 1.0"},
    {:gettext, "~> 0.20"},
    {:jason, "~> 1.2"},
    {:dns_cluster, "~> 0.1.1"},
    {:plug_cowboy, "~> 2.5"}
  ]
end
```

## Project Structure 

The main application logic resides in:
- `lib/hello_phoenix/` - Core application code
- `lib/hello_phoenix_web/` - Web layer code

## Task Management Implementation

### 1. Database Schema

Create a Task schema for storing task data:

```bash
mix phx.gen.schema Task tasks title:string description:text completed:boolean
```

This generates:
- `lib/hello_phoenix/task.ex` - Task schema
- `priv/repo/migrations/TIMESTAMP_create_tasks.exs` - Migration file

Run the migration:

```bash
mix ecto.migrate
```

### 2. Controller and Views

Created the TaskController with RESTful actions:

```bash
# Generate HTML controller, views, and templates
mix phx.gen.html Tasks Task tasks title:string description:text completed:boolean
```

OR manually created if the above command has version compatibility issues:

```elixir
# lib/hello_phoenix_web/controllers/task_controller.ex
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
    render(conn, :new, changeset: changeset)
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

  # Show, edit, update and delete actions...
end
```

### 3. Routes Configuration

Added Task routes to the router:

```elixir
# lib/hello_phoenix_web/router.ex
scope "/", HelloPhoenixWeb do
  pipe_through :browser

  get "/", PageController, :home
  
  resources "/tasks", TaskController
end
```

### 4. Task Templates

Created templates for task operations:
- `task_html/index.html.heex` - List all tasks
- `task_html/new.html.heex` - Create a new task
- `task_html/edit.html.heex` - Edit an existing task
- `task_html/show.html.heex` - View a single task
- `task_html/task_form.html.heex` - Form partial for new/edit

### 5. Home Page Integration

Modified the homepage to show tasks:

```elixir
# lib/hello_phoenix_web/controllers/page_controller.ex
defmodule HelloPhoenixWeb.PageController do
  use HelloPhoenixWeb, :controller

  alias HelloPhoenix.Repo
  alias HelloPhoenix.Task

  def home(conn, _params) do
    tasks = Repo.all(Task)
    render(conn, :home, tasks: tasks)
  end
end
```

## Common Issues and Troubleshooting

### 1. Layout Rendering Issues

**Problem**: Phoenix templates were showing template tags like `{@inner_content}` instead of rendering the content.

**Solution**: Updated all template rendering to use the proper EEx syntax:
- Changed `{@inner_content}` to `<%= @inner_content %>`
- Fixed in `root.html.heex` and `app.html.heex`

**Files fixed**:
```
lib/hello_phoenix_web/components/layouts/root.html.heex
lib/hello_phoenix_web/components/layouts/app.html.heex
```

### 2. Component Rendering Issues

**Problem**: Core components were displaying raw template code like `{render_slot(@inner_block)}` and `{col[:label]}`.

**Solution**: Updated all component rendering to use the proper EEx syntax:
- Changed `{render_slot(@inner_block)}` to `<%= render_slot(@inner_block) %>`
- Fixed in `core_components.ex` file

**File fixed**:
```
lib/hello_phoenix_web/components/core_components.ex
```

### 3. Phoenix.Component.used_input? Function Error

**Problem**: Encountered error `function Phoenix.Component.used_input?/1 is undefined or private` when trying to access form pages.

**Solution**: Created a custom implementation of the `used_input?` function and modified the input component logic:

```elixir
def input(%{field: %Phoenix.HTML.FormField{} = field} = assigns) do
  errors = field.errors || []

  assigns
  |> assign(field: nil, id: assigns.id || field.id)
  |> assign(:errors, Enum.map(errors, &translate_error(&1)))
  |> assign_new(:name, fn -> if assigns.multiple, do: field.name <> "[]", else: field.name end)
  |> assign_new(:value, fn -> field.value end)
  |> input()
end
```

### 4. Migration Issues

**Problem**: When running migrations, encountered `table "tasks" already exists` error.

**Solution**: Modified the migration file to use `create_if_not_exists` instead of `create`:

```elixir
defmodule HelloPhoenix.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:tasks) do
      add :title, :string
      add :description, :text
      add :completed, :boolean, default: false, null: false

      timestamps()
    end
  end
end
```

## Running the Application

To start the Phoenix server:

```bash
# Install dependencies
mix deps.get

# Create and migrate database
mix ecto.setup

# Start Phoenix endpoint
mix phx.server
```

Then visit [`localhost:4000`](http://localhost:4000) from your browser.

## Task App Features

- View all tasks on the homepage
- Create new tasks
- View task details
- Edit existing tasks
- Delete tasks
- Track task completion status

## Production Deployment

Ready to run in production? Please [check the Phoenix deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
