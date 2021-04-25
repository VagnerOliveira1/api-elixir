defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is special, returns a special message" do
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "You are very special banana"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is not special, returns a special message" do
      params = %{"name" => "vagner", "age" => "19"}
      expected_result = {:ok, "Welcome vagner"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is under age, returns an error" do
      params = %{"name" => "vagner", "age" => "16"}
      expected_result = {:ok, "You shall not pass vagner"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end
