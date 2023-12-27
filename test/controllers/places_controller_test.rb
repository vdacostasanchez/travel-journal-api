require "test_helper"

class PlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = User.create(name: "tiger", email: "tiger@test.com", password: "password")
    post "/sessions.json", params: { email: "tiger@test.com", password: "password" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/places.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Place.count, data.length
  end

  test "create" do
    assert_difference "Place.count", 1 do
      post "/places.json",
           params: { trip_id: Trip.first.id, name: "Lake", date: 20231220, address: "Place st. " },
           headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end
  end

  test "show" do
    get "/places/#{Place.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "trip_id", "name", "date", "address", "created_at", "updated_at"], data.keys
  end

  test "update" do
    place = Place.first
    patch "/places/#{place.id}.json",
          params: { name: "Updated name" },
          headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "destroy" do
    assert_difference "Place.count", -1 do
      delete "/places/#{Place.first.id}.json",
             headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end
  end
end
