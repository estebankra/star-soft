json.extract! order_detail, :id, :firstname, :lastname, :number, :size, :created_at, :updated_at
json.url order_detail_url(order_detail, format: :json)
