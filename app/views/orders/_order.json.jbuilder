json.extract! order, :id, :deliver_date, :client_id, :course_club, :logo, :state, :notes, :quantity, :created_at, :updated_at
json.url order_url(order, format: :json)
