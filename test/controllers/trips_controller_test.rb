require "test_helper"

class TripsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/trips.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Trip.count, data.length
  end

  test "create" do
    assert_difference "Trip.count", 1 do
      post "/trips.json", params: { user_id: 1, start_date: 20000101, end_date: 20001231, location: "Test location" }
      assert_response 200
    end
  end

  test "show" do
    trip = Trip.first
    get "/trips/#{trip.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "start_date", "end_date", "location", "created_at", "updated_at"], data.keys
  end

  test "update" do
    trip = Trip.first
    patch "/trips/#{Trip.id}.json", params: { location: "Updated Location" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated Location", data["location"]
  end
end
