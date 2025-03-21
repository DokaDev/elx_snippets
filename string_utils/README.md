# Elixir String Utilities

A collection of utility functions for working with strings in Elixir. This project demonstrates basic Elixir syntax, module organization, and string manipulation techniques.

## Project Setup

### Prerequisites
- Elixir 1.14+
- Mix (Elixir's build tool)

### Project Creation

```bash
# Create a new Elixir project
mix new string_utils
cd string_utils
```

## Project Structure

- `lib/string_utils.ex` - Main module with string manipulation functions
- `test/string_utils_test.exs` - Unit tests for the string utility functions

## Implemented Functions

The `StringUtils` module includes the following functions:

```elixir
defmodule StringUtils do
  @moduledoc """
  Utility functions for working with strings.
  """
  
  @doc """
  Reverses a string.
  
  ## Examples
  
      iex> StringUtils.reverse("hello")
      "olleh"
  """
  def reverse(str) do
    str |> String.reverse()
  end
  
  @doc """
  Counts the number of words in a string.
  
  ## Examples
  
      iex> StringUtils.word_count("hello world")
      2
  """
  def word_count(str) do
    str |> String.split() |> length()
  end
  
  @doc """
  Capitalizes each word in a string.
  
  ## Examples
  
      iex> StringUtils.capitalize_words("hello world")
      "Hello World"
  """
  def capitalize_words(str) do
    str
    |> String.split(" ")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")
  end
  
  @doc """
  Checks if a string is a palindrome (reads the same forward and backward).
  
  ## Examples
  
      iex> StringUtils.is_palindrome("racecar")
      true
      
      iex> StringUtils.is_palindrome("hello")
      false
  """
  def is_palindrome(str) do
    cleaned_str = str |> String.downcase() |> String.replace(~r/[^a-z0-9]/, "")
    cleaned_str == String.reverse(cleaned_str)
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
iex> StringUtils.reverse("hello")
"olleh"

iex> StringUtils.word_count("hello elixir world")
3

iex> StringUtils.capitalize_words("hello elixir world")
"Hello Elixir World"

iex> StringUtils.is_palindrome("racecar")
true
```

### Running Tests

Execute the tests with:

```bash
mix test
```

## Common Issues and Troubleshooting

### Module Not Found

**Problem**: When trying to use functions in IEx, you might see an error like `** (UndefinedFunctionError) function StringUtils.function_name/1 is undefined or private`

**Solution**: Make sure you're running IEx with the project loaded:

```bash
# Run this in the project directory
iex -S mix
```

### Syntax Errors

**Problem**: Syntax errors when using pipe operators.

**Solution**: Ensure proper syntax with pipe operators:

```elixir
# Correct usage of pipe operators
def capitalize_words(str) do
  str
  |> String.split(" ")
  |> Enum.map(&String.capitalize/1)
  |> Enum.join(" ")
end
```

## Learning Resources

- [Elixir Official Documentation](https://elixir-lang.org/docs.html)
- [Elixir School](https://elixirschool.com/) - Great for Elixir beginners
- [Elixir Forum](https://elixirforum.com/) - Community support

