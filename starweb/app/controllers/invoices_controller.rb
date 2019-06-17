class InvoicesController < ApplicationController
  def index
  end

  def new
    @invoice= Order.find(params[:id])
  end
end
