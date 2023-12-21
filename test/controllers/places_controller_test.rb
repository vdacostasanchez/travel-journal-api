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
end
