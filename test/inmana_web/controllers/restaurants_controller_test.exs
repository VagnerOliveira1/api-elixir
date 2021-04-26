defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase, async: true

  describe "create/2" do
    test "when all parms are valid, creates the user", %{conn: conn} do
      params = %{name: "Altas Horas", email: "altas@gmail.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "altas@gmail.com",
                 "id" => _id,
                 "name" => "Altas Horas"
               }
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{email: "altas@gmail.com"}

      expected_response = %{"message" => %{"name" => ["can't be blank"]}}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end
end
