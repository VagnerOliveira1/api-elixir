defmodule Inmana.RestaurantTest do
  use Inmana.DataCase

  alias Ecto.Changeset
  alias Inmana.Restaurant

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Altas Horas", email: "altashoras@gmail.com"}

      response = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{email: "altashoras@gmail.com", name: "Altas Horas"},
               valid?: true
             } = response
    end

    test "when all params are valid, returns an invalid changeset" do
      params = %{name: "a", email: ""}

      expected_responde = %{
        email: ["can't be blank"],
        name: ["should be at least 3 character(s)"]
      }

      response = Restaurant.changeset(params)

      assert %Changeset{
               valid?: false
             } = response

      assert errors_on(response) == expected_responde
    end
  end
end
