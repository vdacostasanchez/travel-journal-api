require "test_helper"

class PlacesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/places.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Place.count, data.length
  end
end
