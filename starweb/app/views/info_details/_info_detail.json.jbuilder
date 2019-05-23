json.extract! info_detail, :id, :firstname, :lastname, :number, :size, :created_at, :updated_at
json.url info_detail_url(info_detail, format: :json)
