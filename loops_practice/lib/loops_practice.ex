defmodule LoopsPractice do
  # This module demonstrates different ways to iterate in Elixir

  @moduledoc """
  Documentation for `LoopsPractice`.
  This module demonstrates various ways to perform iterations in Elixir.
  """

  # To run this function in IEx shell:
  # iex> LoopsPractice.hello()
  @doc """
  Hello world.

  ## Examples

      iex> LoopsPractice.hello()
      :world

  """
  def hello do
    :world
  end

  # To run this function in IEx shell:
  # iex> LoopsPractice.count_to(5)
  @doc """
  # Method 1: Recursion
  # Counts from 1 to n using recursive function calls
  # Recursion is the most basic form of iteration in functional programming

  ## Examples

      iex> LoopsPractice.count_to(5)
      [1, 2, 3, 4, 5]

  """
  def count_to(n) do
    # Call a private helper function with an accumulator
    count_to_helper(n, [])
  end

  # Private helper function (denoted by defp)
  defp count_to_helper(0, acc) do
    # Base case: when we reach 0, return the accumulated list
    acc
  end

  defp count_to_helper(n, acc) when n > 0 do
    # Recursive case: add the current number to accumulator and call with n-1
    count_to_helper(n - 1, [n | acc])
  end

  # To run this function in IEx shell:
  # iex> LoopsPractice.squares(4)
  @doc """
  # Method 2: Using Enum.map
  # Generates squares of numbers from 1 to n
  # Enum module provides functions for working with collections

  ## Examples

      iex> LoopsPractice.squares(4)
      [1, 4, 9, 16]

  """
  def squares(n) do
    # Create a range from 1 to n
    # Then map each number to its square
    1..n |> Enum.map(fn x -> x * x end)
  end

  # To run this function in IEx shell:
  # iex> LoopsPractice.factorial(5)
  @doc """
  # Method 3: Using Enum.reduce
  # Calculates factorial using reduce
  # Reduce is a powerful function for accumulating values

  ## Examples

      iex> LoopsPractice.factorial(5)
      120

  """
  def factorial(n) do
    # Multiply all numbers from 1 to n
    1..n |> Enum.reduce(1, fn x, acc -> x * acc end)
  end

  # To run this function in IEx shell:
  # iex> LoopsPractice.even_squares(6)
  @doc """
  # Method 4: Using list comprehension
  # Filters and processes elements in one step
  # List comprehensions provide a concise syntax for map+filter

  ## Examples

      iex> LoopsPractice.even_squares(6)
      [4, 16, 36]

  """
  def even_squares(n) do
    # List comprehension: for each number in range, if even, square it
    for x <- 1..n, rem(x, 2) == 0, do: x * x
  end

  # To run this function in IEx shell:
  # iex> LoopsPractice.double_list([1, 2, 3])
  @doc """
  # Method 5: Iterating through a list
  # Processes each element of a list using Enum functions
  # Shows how to work with existing collections

  ## Examples

      iex> LoopsPractice.double_list([1, 2, 3])
      [2, 4, 6]

  """
  def double_list(list) do
    # Map over the list, doubling each element
    Enum.map(list, fn x -> x * 2 end)
  end

  # To run this function in IEx shell:
  # iex> LoopsPractice.process_numbers(10)
  @doc """
  # Method 6: Using pipeline operator for chained operations
  # Shows how to combine multiple iterations
  # This is a common pattern in Elixir for data transformations

  ## Examples

      iex> LoopsPractice.process_numbers(10)
      [20, 40, 60, 80, 100]

  """
  def process_numbers(n) do
    1..n
    |> Enum.filter(fn x -> rem(x, 2) == 0 end)  # Keep only even numbers
    |> Enum.map(fn x -> x * 10 end)             # Multiply each by 10
  end
end
