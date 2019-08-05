class InvoicesController < ApplicationController
  require 'invoicing/ledger_item/pdf_generator'
  before_action :authenticate_user!
  # before_action :set_invoice, only: [:edit]

  def index
    invoice = EndUserInvoice.new(sender: current_user, recipient: @order.client, currency: 'USD')
    invoice.line_items.build(description: 'Goodies: T-Shirt',
                             net_amount: 10, tax_amount: 0)
    invoice.line_items.build(description: 'Goodies: Coffee Cup',
                             net_amount: 20, tax_amount: 1.3, quantity: 3)
    invoice.save

    pdf_creator = Invoicing::LedgerItem::PdfGenerator.new(invoice)
    pdf_file = pdf_creator.render Rails.root.join('pdf')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_invoice
    # @hasProduct = HasProduct.find(params[:id])
  # end
end
