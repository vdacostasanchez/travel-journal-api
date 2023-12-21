require "test_helper"

class PlacesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/places.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Place.count, data.length
  end

  test "create" do
    assert_difference "Place.count", 1 do
      post "/places.json", params: { user_id: 1, trip_id: 1, name: "Lake", date: 20231220, address: "Place st. " }
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
    patch "/places/#{place.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "destroy" do
    assert_difference "Place.count", -1 do
      delete "/places/#{Place.first.id}.json"
      assert_response 200
    end
  end
end
