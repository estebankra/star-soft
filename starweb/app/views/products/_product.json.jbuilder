json.extract! product, :id, :name, :price, :quantity, :image, :size, :description, :created_at, :updated_at
json.url product_url(product, format: :json)
