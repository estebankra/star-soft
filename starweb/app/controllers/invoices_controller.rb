class InvoicesController < ApplicationController
  before_action :authenticate_user!

  def index
    invoice = EndUserInvoice.new(sender: current_user, recipient: current_user, currency: 'USD')
    invoice.line_items.build(description: 'Goodies: T-Shirt',
                             net_amount: 10, tax_amount: 0)
    invoice.line_items.build(description: 'Goodies: Coffee Cup',
                             net_amount: 20, tax_amount: 1.3, quantity: 3)
    invoice.save
  end
end
