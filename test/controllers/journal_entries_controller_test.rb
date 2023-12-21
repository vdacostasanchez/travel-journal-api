require "test_helper"

class JournalEntriesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/journal_entries.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal JournalEntry.count, data.length
  end
end
