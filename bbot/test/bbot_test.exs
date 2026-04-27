defmodule BbotTest do
  use ExUnit.Case
  doctest Bbot

  test "greets the world" do
    assert Bbot.hello() == :world
  end
end
