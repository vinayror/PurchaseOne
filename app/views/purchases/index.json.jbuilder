json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :date, :title
  json.url purchase_url(purchase, format: :json)
end
