class EndUserInvoice < Invoice
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'Client'
end
