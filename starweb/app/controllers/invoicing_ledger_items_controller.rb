class InvoicingLedgerItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    params[:q] ||= {}
    if params[:q][:created_at_lteq].present?
      params[:q][:created_at_lteq] = params[:q][:created_at_lteq].to_date.end_of_day
    end

    # Filter data by search send by view
    @q = InvoicingLedgerItem.ransack(params[:q])
    # Paginate the result
    @invoices = @q.result.includes(:recipient).page(params[:page]).per(params[:per])
  end

  def show
    @invoice = InvoicingLedgerItem.find(params[:id])
  end
end