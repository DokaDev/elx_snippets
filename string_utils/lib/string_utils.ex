defmodule StringUtils do
  # This module provides utility functions for string manipulation

  @moduledoc """
  Documentation for `StringUtils`.
  A collection of utility functions for working with strings.
  """

  @doc """
  Hello world.

  ## Examples

      iex> StringUtils.hello()
      :world

  """
  def hello do
    :world
  end

  # To run this function in IEx shell:
  # iex> StringUtils.reverse("hello")
  @doc """
  Reverses a string.

  ## Examples

      iex> StringUtils.reverse("hello")
      "olleh"

      iex> StringUtils.reverse("Elixir")
      "rixilE"

  """
  def reverse(string) do
    # Convert string to charlist, reverse it, and convert back to string
    string |> String.to_charlist() |> Enum.reverse() |> List.to_string()
  end

  # To run this function in IEx shell:
  # iex> StringUtils.capitalize_words("hello world")
  @doc """
  Capitalizes each word in a string.

  ## Examples

      iex> StringUtils.capitalize_words("hello world")
      "Hello World"

      iex> StringUtils.capitalize_words("elixir programming")
      "Elixir Programming"

  """
  def capitalize_words(string) do
    # Split the string by spaces, capitalize each word, then join back
    string
    |> String.split(" ")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")
  end

  # To run this function in IEx shell:
  # iex> StringUtils.count_vowels("hello")
  @doc """
  Counts the number of vowels in a string.

  ## Examples

      iex> StringUtils.count_vowels("hello")
      2

      iex> StringUtils.count_vowels("Elixir")
      3

  """
  def count_vowels(string) do
    # Convert to lowercase to handle both upper and lower case vowels
    # Then count how many characters are vowels
    string
    |> String.downcase()
    |> String.graphemes()
    |> Enum.count(fn char -> char in ["a", "e", "i", "o", "u"] end)
  end

  # To run this function in IEx shell:
  # iex> StringUtils.palindrome?("racecar")
  @doc """
  Checks if a string is a palindrome (reads the same forwards and backwards).
  Ignores case and non-alphanumeric characters.

  ## Examples

      iex> StringUtils.palindrome?("racecar")
      true

      iex> StringUtils.palindrome?("hello")
      false

      iex> StringUtils.palindrome?("A man, a plan, a canal: Panama")
      true

  """
  def palindrome?(string) do
    # Remove non-alphanumeric characters and convert to lowercase
    cleaned = string
      |> String.downcase()
      |> String.replace(~r/[^a-z0-9]/, "")

    # Compare with its reverse
    cleaned == reverse(cleaned)
  end

  # To run this function in IEx shell:
  # iex> StringUtils.word_count("Hello world! This is a test.")
  @doc """
  Counts the number of words in a string.

  ## Examples

      iex> StringUtils.word_count("Hello world!")
      2

      iex> StringUtils.word_count("This is a test. With multiple sentences.")
      7

  """
  def word_count(string) do
    # Split by whitespace and count non-empty words
    string
    |> String.split(~r/\s+/)
    |> Enum.filter(fn word -> word != "" end)
    |> length()
  end
end
