json.id trip.id
json.user_id trip.user_id
json.start_date trip.start_date
json.end_date trip.end_date
json.location trip.location
json.places trip.places.map do |place|
  json.name place.name
  json.date place.date
  json.address place.address
end
json.journal_entries trip.journal_entries.map do |journal_entry|
  json.title journal_entry.title
  json.date journal_entry.date
  json.entry journal_entry.entry
end
json.created_at trip.created_at
json.updated_at trip.updated_at

