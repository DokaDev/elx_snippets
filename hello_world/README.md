# Elixir Hello World

A simple "Hello World" project in Elixir, demonstrating the basic project structure and syntax of Elixir programs.

## Project Setup

### Prerequisites
- Elixir 1.14+
- Mix (Elixir's build tool)

### Project Creation

```bash
# Create a new Elixir project
mix new hello_world
cd hello_world
```

## Project Structure

- `lib/hello_world.ex` - Main module with greeting functions
- `test/hello_world_test.exs` - Unit tests for the greeting functions

## Implemented Functions

The `HelloWorld` module includes the following functions:

```elixir
defmodule HelloWorld do
  @moduledoc """
  A simple module that provides greeting functionality.
  """
  
  @doc """
  Outputs "Hello, World!" message.
  
  ## Examples
  
      iex> HelloWorld.hello()
      "Hello, World!"
  """
  def hello do
    "Hello, World!"
  end
  
  @doc """
  Outputs a personalized greeting message for the provided name.
  
  ## Examples
  
      iex> HelloWorld.greet("Alice")
      "Hello, Alice!"
  """
  def greet(name) do
    "Hello, #{name}!"
  end
  
  @doc """
  Outputs a greeting message with the provided greeting and name.
  
  ## Examples
  
      iex> HelloWorld.greet_with("Howdy", "Bob")
      "Howdy, Bob!"
  """
  def greet_with(greeting, name) do
    "#{greeting}, #{name}!"
  end
  
  @doc """
  Outputs a time-appropriate greeting based on the current hour.
  
  ## Examples
  
      # If it's 9am:
      iex> HelloWorld.time_greeting("Elixir")
      "Good morning, Elixir!"
      
      # If it's 2pm:
      iex> HelloWorld.time_greeting("Elixir")
      "Good afternoon, Elixir!"
      
      # If it's 8pm:
      iex> HelloWorld.time_greeting("Elixir")
      "Good evening, Elixir!"
  """
  def time_greeting(name) do
    {hour, _, _} = :erlang.time()
    
    greeting = cond do
      hour < 12 -> "Good morning"
      hour < 18 -> "Good afternoon"
      true -> "Good evening"
    end
    
    "#{greeting}, #{name}!"
  end
end
```

## Running the Code

### Interactive Elixir Shell (IEx)

Start an interactive Elixir shell with the project loaded:

```bash
iex -S mix
```

Then use the functions:

```elixir
iex> HelloWorld.hello()
"Hello, World!"

iex> HelloWorld.greet("Bob")
"Hello, Bob!"

iex> HelloWorld.greet_with("Hola", "Maria")
"Hola, Maria!"

iex> HelloWorld.time_greeting("Elixir")
"Good afternoon, Elixir!"  # Output will vary based on time of day
```

### Running the App from Command Line

To run the app directly from the command line:

```bash
mix run -e "IO.puts HelloWorld.hello()"
```

### Running Tests

Execute the tests with:

```bash
mix test
```

## Common Issues and Troubleshooting

### Module Not Found

**Problem**: When trying to use functions in IEx, you might see an error like `** (UndefinedFunctionError) function HelloWorld.hello/0 is undefined or private`

**Solution**: Make sure you're running IEx with the project loaded:

```bash
# Run this in the project directory
iex -S mix
```

### String Interpolation

**Problem**: Issues with string interpolation syntax.

**Solution**: Use `#{}` for string interpolation in Elixir:

```elixir
# Correct string interpolation
def greet(name) do
  "Hello, #{name}!"
end
```

## Learning Resources

- [Elixir Getting Started Guide](https://elixir-lang.org/getting-started/introduction.html)
- [Elixir School](https://elixirschool.com/) - Great for Elixir beginners
- [Elixir Forum](https://elixirforum.com/) - Community support

