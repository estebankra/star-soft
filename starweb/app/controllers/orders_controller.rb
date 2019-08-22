class OrdersController < ApplicationController
  require 'httparty'
  before_action :authenticate_user!
  before_action :authenticate_secretary!, only: [:new, :edit, :create, :update, :destroy, :invoice, :pay]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    params[:q] ||= {}
    if params[:q][:deliver_date_lteq].present?
      params[:q][:deliver_date_lteq] = params[:q][:deliver_date_lteq].to_date.end_of_day
    end

    # Filter data by search send by view
    @q = Order.includes(:client).ransack(params[:q])
    # Paginate the result
    @orders = @q.result.page(params[:page]).per(params[:per])

    if params[:state].present?
      @orders = @orders.where("state = ?", params[:state])
    end
    @orders = @orders.where("paid = ?", params[:paid]) if params[:paid].present?
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @hasProduct = HasProduct.new
    @has_used_supply = HasUsedSupply.new
    @order_detail = OrderDetail.new

    if @order.paid == 'No pagado'
      # Quotations
      real = HTTParty.get('https://api.cambio.today/v1/quotes/BRL/PYG/json?quantity=1&key=2291|UcRBwxvE*C~uzgnYu6~ESYN5VbugBB6A')
      peso = HTTParty.get('https://api.cambio.today/v1/quotes/ARS/PYG/json?quantity=1&key=2291|UcRBwxvE*C~uzgnYu6~ESYN5VbugBB6A')
      dolar = HTTParty.get('https://api.cambio.today/v1/quotes/USD/PYG/json?quantity=1&key=2291|UcRBwxvE*C~uzgnYu6~ESYN5VbugBB6A')
      @dolar = JSON.parse(dolar.body)
      @peso = JSON.parse(peso.body)
      @real = JSON.parse(real.body)
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    @sponsors = Sponsor.all
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.sponsors = params[:sponsors]

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'El pedido se creó correctamente.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @order.sponsors = params[:sponsors]
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'El pedido se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def state
    @order = Order.find(params[:id])
    @order.state =
      if @order.state == 'En espera'
        'En proceso'
      end

    redirect_to @order if @order.save
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.in_trash = @order.in_trash == false
    @order.save
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def invoice
    @order = Order.find(params[:id])
  end

  def pay
    @order = Order.find(params[:id])
    invoice = EndUserInvoice.new(sender: current_user, recipient: @order.client, currency: 'GS', status: 'paid out' )

    total = 0
    @order.has_products.each do |hasProduct|
      invoice.line_items.build(description: hasProduct.product.name,
                               net_amount: hasProduct.product.price, quantity: hasProduct.quantity, tax_amount: 0)
      total += hasProduct.product.price * hasProduct.quantity
    end

    invoice.total_amount = 0
    invoice.save
    @order.paid = 'Pagado'
    @order.save

    redirect_to @order
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:deliver_date, :client_id, :course_club,
                                  :logo, :state, :paid, :notes, :sponsors)
  end
end
