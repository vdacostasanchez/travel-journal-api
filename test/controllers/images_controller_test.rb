require "test_helper"

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/images.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Image.count, data.length
  end

  test "create" do
    assert_difference "Image.count", 1 do
      post "/images.json", params: { user_id: 1, trip_id: 1, date: 20231222, img_url: "img.jpg" }
      assert_response 200
    end
  end
end
