class ClientInvoice < Invoice
  belongs_to :recipient, class_name: 'Client'
end