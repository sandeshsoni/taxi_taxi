defmodule FareEngineTest do
  use ExUnit.Case
  doctest FareEngine

  test "greets the world" do
    assert FareEngine.hello() == :world
  end
end
