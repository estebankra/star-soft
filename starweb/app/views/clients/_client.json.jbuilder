json.extract! client, :id, :firstname, :lastname, :doc/ruc, :telephone, :date_nac, :mail, :city, :country, :created_at, :updated_at
json.url client_url(client, format: :json)
