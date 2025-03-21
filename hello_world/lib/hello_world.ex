defmodule HelloWorld do
  # This defines a module named HelloWorld, which is a collection of functions

  @moduledoc """
  Documentation for `HelloWorld`.
  This module demonstrates basic Elixir functionality.
  """

  @doc """
  # Function that returns a greeting message.
  # @doc is used to document functions for generating documentation.

  ## Examples

      iex> HelloWorld.hello()
      "Hello, Elixir World!"

  """
  def hello do
    # This defines a public function named 'hello' that takes no arguments
    # It returns a simple string greeting
    "Hello, Elixir World!"
  end

  @doc """
  # Greets a person by name.
  # Takes a name parameter and returns a personalized greeting.

  ## Examples

      iex> HelloWorld.greet("John")
      "Hello, John! Welcome to Elixir!"

  """
  def greet(name) do
    # This function takes one argument - the person's name
    # String interpolation is done with #{}
    "Hello, #{name}! Welcome to Elixir!"
  end

  @doc """
  # Performs basic arithmetic operations using pattern matching.
  # This demonstrates how pattern matching works in Elixir function definitions.

  ## Examples

      iex> HelloWorld.calculate(:add, 5, 3)
      8

      iex> HelloWorld.calculate(:subtract, 10, 2)
      8

      iex> HelloWorld.calculate(:multiply, 4, 3)
      12

      iex> HelloWorld.calculate(:divide, 10, 2)
      5.0

  """
  # Each function clause matches a different operation
  def calculate(:add, a, b) do # :add: atom representing the operation(just like a string constant)
    # This clause handles addition
    a + b
  end

  def calculate(:subtract, a, b) do
    # This clause handles subtraction
    a - b
  end

  def calculate(:multiply, a, b) do
    # This clause handles multiplication
    a * b
  end

  def calculate(:divide, a, b) do
    # This clause handles division
    # Division in Elixir returns a float
    a / b
  end

  def calculate(unknown, _, _) do
    # This is a fallback clause for unknown operations
    # The underscore (_) means we don't care about these arguments
    "Unknown operation: #{unknown}"
  end
end
