json.extract! beer, :id, :name, :type, :country, :price, :created_at, :updated_at
json.url beer_url(beer, format: :json)
