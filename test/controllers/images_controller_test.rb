require "test_helper"

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    User.create(name: "tiger", email: "tiger@test.com", password: "password", password_confirmation: "password")
    post "/sessions.json", params: { email: "tiger@test.com", password: "password" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/images.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Image.count, data.length
  end

  test "create" do
    assert_difference "Image.count", 1 do
      post "/images.json",
           params: { trip_id: Trip.first.id, date: 20231222, img_url: "img.jpg" },
           headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end
  end

  test "show" do
    get "/images/#{Image.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "trip_id", "date", "img_url", "created_at", "updated_at"], data.keys
  end

  test "update" do
    image = Image.first
    patch "/images/#{image.id}.json",
          params: { img_url: "Updated img_url" },
          headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated img_url", data["img_url"]
  end

  test "destroy" do
    assert_difference "Image.count", -1 do
      delete "/images/#{Image.first.id}.json",
             headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end
  end
end
