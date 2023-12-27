require "test_helper"

class TripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = User.create(name: "valeria", email: "valeria@test.com", password: "password", password_confirmation: "password")
    post "/sessions.json", params: { email: "valeria@test.com", password: "password" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/trips.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Trip.count, data.length
  end

  test "create" do
    assert_difference "Trip.count", 1 do
      post "/trips.json",
           params: { start_date: 20000101, end_date: 20001231, location: "Test location" },
           headers: { "Authorization" => "Bearer #{@jwt}" }
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
    patch "/trips/#{trip.id}.json",
          params: { location: "Updated Location" },
          headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated Location", data["location"]
  end

  test "destroy" do
    assert_difference "Trip.count", -1 do
      delete "/trips/#{Trip.first.id}.json",
             headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end
  end
end
