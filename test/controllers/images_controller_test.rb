require "test_helper"

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/images.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Image.count, data.length
  end
end
