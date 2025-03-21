defmodule LoopsPracticeTest do
  use ExUnit.Case
  doctest LoopsPractice

  test "greets the world" do
    assert LoopsPractice.hello() == :world
  end
end
