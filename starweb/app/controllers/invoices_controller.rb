class InvoicesController < ApplicationController
  require 'invoicing/ledger_item/pdf_generator'
  before_action :authenticate_user!
  # before_action :set_invoice, only: [:edit]

  def index
    @invoices = InvoicingLedgerItem.all
  end
end
