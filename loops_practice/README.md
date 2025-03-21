# Elixir Loops Practice

This project demonstrates various approaches to iteration and looping in Elixir, a functional programming language where traditional loops are replaced with recursion and higher-order functions.

## Project Setup

### Prerequisites
- Elixir 1.14+
- Mix (Elixir's build tool)

### Project Creation

```bash
# Create a new Elixir project
mix new loops_practice
cd loops_practice
```

## Project Structure

- `lib/loops_practice.ex` - Main module with loop implementation examples
- `test/loops_practice_test.exs` - Unit tests for the loop functions

## Implemented Loop Patterns

The `LoopsPractice` module implements various approaches to iteration in Elixir:

```elixir
defmodule LoopsPractice do
  @moduledoc """
  Demonstrates different looping techniques in Elixir.
  """
  
  @doc """
  Sums numbers from 1 to n using recursion.
  
  ## Examples
  
      iex> LoopsPractice.sum_recursive(5)
      15
  """
  def sum_recursive(n) when n <= 0, do: 0
  def sum_recursive(n), do: n + sum_recursive(n - 1)
  
  @doc """
  Sums numbers from 1 to n using Enum functions.
  
  ## Examples
  
      iex> LoopsPractice.sum_enum(5)
      15
  """
  def sum_enum(n) when n <= 0, do: 0
  def sum_enum(n), do: Enum.sum(1..n)
  
  @doc """
  Sums numbers from 1 to n using tail recursion.
  
  ## Examples
  
      iex> LoopsPractice.sum_tail_recursive(5)
      15
  """
  def sum_tail_recursive(n), do: do_sum(n, 0)
  
  defp do_sum(0, acc), do: acc
  defp do_sum(n, acc) when n > 0, do: do_sum(n - 1, acc + n)
  
  @doc """
  Filters even numbers from a list using recursion.
  
  ## Examples
  
      iex> LoopsPractice.filter_even_recursive([1, 2, 3, 4, 5, 6])
      [2, 4, 6]
  """
  def filter_even_recursive([]), do: []
  def filter_even_recursive([head | tail]) when rem(head, 2) == 0, do: [head | filter_even_recursive(tail)]
  def filter_even_recursive([_head | tail]), do: filter_even_recursive(tail)
  
  @doc """
  Filters even numbers from a list using Enum functions.
  
  ## Examples
  
      iex> LoopsPractice.filter_even_enum([1, 2, 3, 4, 5, 6])
      [2, 4, 6]
  """
  def filter_even_enum(list), do: Enum.filter(list, fn x -> rem(x, 2) == 0 end)
  
  @doc """
  Maps a function to each element in a list using recursion.
  
  ## Examples
  
      iex> LoopsPractice.map_recursive([1, 2, 3], fn x -> x * 2 end)
      [2, 4, 6]
  """
  def map_recursive([], _func), do: []
  def map_recursive([head | tail], func), do: [func.(head) | map_recursive(tail, func)]
  
  @doc """
  Maps a function to each element in a list using Enum functions.
  
  ## Examples
  
      iex> LoopsPractice.map_enum([1, 2, 3], fn x -> x * 2 end)
      [2, 4, 6]
  """
  def map_enum(list, func), do: Enum.map(list, func)
  
  @doc """
  Demonstrates loop patterns with comprehensions.
  
  ## Examples
  
      iex> LoopsPractice.comprehension_example([1, 2, 3, 4])
      [2, 4, 6, 8]
  """
  def comprehension_example(list) do
    for x <- list, do: x * 2
  end
  
  @doc """
  Demonstrates filtering with comprehensions.
  
  ## Examples
  
      iex> LoopsPractice.filtered_comprehension([1, 2, 3, 4, 5, 6])
      [4, 8, 12]
  """
  def filtered_comprehension(list) do
    for x <- list, rem(x, 2) == 0, do: x * 2
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
iex> LoopsPractice.sum_recursive(10)
55

iex> LoopsPractice.sum_enum(10)
55

iex> LoopsPractice.filter_even_recursive([1, 2, 3, 4, 5, 6, 7, 8])
[2, 4, 6, 8]

iex> LoopsPractice.comprehension_example(1..5)
[2, 4, 6, 8, 10]
```

### Running Tests

Execute the tests with:

```bash
mix test
```

## Common Issues and Troubleshooting

### Stack Overflow with Recursion

**Problem**: When using recursion with large inputs, you might encounter stack overflow errors.

**Solution**: Use tail recursion to optimize stack usage:

```elixir
# Tail recursive version (more efficient)
def sum_tail_recursive(n), do: do_sum(n, 0)
  
defp do_sum(0, acc), do: acc
defp do_sum(n, acc) when n > 0, do: do_sum(n - 1, acc + n)
```

### Pattern Matching Issues

**Problem**: Unexpected behavior when using pattern matching in recursive functions.

**Solution**: Ensure the function clauses are in the correct order (more specific clauses should come before general ones):

```elixir
# Correct order - base case first
def filter_even_recursive([]), do: []
def filter_even_recursive([head | tail]) when rem(head, 2) == 0, do: [head | filter_even_recursive(tail)]
def filter_even_recursive([_head | tail]), do: filter_even_recursive(tail)
```

## Key Concepts in Elixir Iteration

1. **Recursion** - The primary way to iterate in functional programming
2. **Tail Recursion** - Optimized recursion that avoids stack overflow
3. **Enum Module** - Higher-order functions for collection processing
4. **List Comprehensions** - Elegant syntax for collection processing
5. **Pattern Matching** - Key mechanism for flow control in recursion

## Learning Resources

- [Elixir Official Documentation](https://elixir-lang.org/docs.html)
- [Elixir School: Recursion](https://elixirschool.com/en/lessons/basics/functions#recursion-5)
- [Enum Module Documentation](https://hexdocs.pm/elixir/Enum.html)
- [List Comprehensions](https://elixir-lang.org/getting-started/comprehensions.html)

