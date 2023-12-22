require "test_helper"

class JournalEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    User.create(name: "tiger", email: "tiger@test.com", password: "password")
    post "/sessions.json", params: { email: "tiger@test.com", password: "password" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/journal_entries.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal JournalEntry.count, data.length
  end

  test "create" do
    assert_difference "JournalEntry.count", 1 do
      post "/users.json", params: { name: "test", email: "test@test.com", password: "password", password_confirmation: "password" }
      post "/sessions.json", params: { email: "test@test.com", password: "password" }
      data = JSON.parse(response.body)
      jwt = data["jwt"]

      post "/journal_entries.json",
           params: { title: "Title", date: 20000101, entry: "This is not a really long entry", trip_id: 1, user_id: 1, public: false },
           headers: { "Authorization" => "Bearer #{jwt}" }
      assert_response 200
    end
  end

  test "show" do
    get "/journal_entries/#{JournalEntry.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "title", "date", "entry", "trip_id", "user_id", "public", "created_at", "updated_at"], data.keys
  end

  test "update" do
    journal_entry = JournalEntry.first
    patch "/journal_entries/#{journal_entry.id}.json",
          params: { title: "Updated title" },
          headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated title", data["title"]
  end

  test "destroy" do
    assert_difference "JournalEntry.count", -1 do
      delete "/journal_entries/#{JournalEntry.first.id}.json",
             headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end
  end
end
