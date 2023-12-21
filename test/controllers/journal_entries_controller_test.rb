require "test_helper"

class JournalEntriesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/journal_entries.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal JournalEntry.count, data.length
  end

  test "create" do
    assert_difference "JournalEntry.count", 1 do
      post "/journal_entries.json", params: { title: "Title", date: 20000101, entry: "This is not a really long entry", trip_id: 1, user_id: 1, public: false }
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
    patch "/journal_entries/#{journal_entry.id}.json", params: { title: "Updated title" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated title", data["title"]
  end
end
