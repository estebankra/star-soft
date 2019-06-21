json.extract! invoice, :id, :date, :counted_credit, :order_id, :iva5, :iva10, :total, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
