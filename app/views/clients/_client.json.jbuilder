json.extract! client, :id, :name, :annual_income, :tax, :created_at, :updated_at
json.url client_url(client, format: :json)
