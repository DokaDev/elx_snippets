defmodule StringUtilsTest do
  use ExUnit.Case
  doctest StringUtils

  test "reverse/1 reverses a string" do
    assert StringUtils.reverse("hello") == "olleh"
    assert StringUtils.reverse("abcd") == "dcba"
    assert StringUtils.reverse("") == ""
    assert StringUtils.reverse("a") == "a"
  end

  test "capitalize_words/1 capitalizes each word in a string" do
    assert StringUtils.capitalize_words("hello world") == "Hello World"
    assert StringUtils.capitalize_words("elixir is fun") == "Elixir Is Fun"
    assert StringUtils.capitalize_words("") == ""
    assert StringUtils.capitalize_words("hello") == "Hello"
  end

  test "count_vowels/1 counts the number of vowels in a string" do
    assert StringUtils.count_vowels("hello") == 2
    assert StringUtils.count_vowels("AEIOU") == 5
    assert StringUtils.count_vowels("sky") == 0
    assert StringUtils.count_vowels("") == 0
  end

  test "palindrome?/1 checks if a string is a palindrome" do
    assert StringUtils.palindrome?("racecar") == true
    assert StringUtils.palindrome?("Madam, I'm Adam") == true
    assert StringUtils.palindrome?("A man, a plan, a canal: Panama") == true
    assert StringUtils.palindrome?("hello") == false
    assert StringUtils.palindrome?("") == true
    assert StringUtils.palindrome?("a") == true
  end

  test "word_count/1 counts the number of words in a string" do
    assert StringUtils.word_count("hello world") == 2
    assert StringUtils.word_count("This is a test") == 4
    assert StringUtils.word_count("") == 0
    assert StringUtils.word_count("one") == 1
    assert StringUtils.word_count("   multiple   spaces   between   ") == 3
  end
end
