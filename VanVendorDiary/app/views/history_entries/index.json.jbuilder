json.array!(@history_entries) do |history_entry|
  json.extract! history_entry, :id, :date_time
  json.url history_entry_url(history_entry, format: :json)
end
