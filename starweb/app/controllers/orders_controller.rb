class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    # Paginate
    @orders = Order.includes(:client).page params[:page]
    if params[:state].present?
      @orders = @orders.where("state = ?", params[:state])
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @hasProduct = HasProduct.new
    @order_detail = OrderDetail.new
  end

  # GET /orders/new
  def new
    @order = Order.new
    @sponsors = Sponsor.all
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
        format.html { redirect_to @order, notice: 'Order successfully created.' }
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
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def state
    @order = Order.find(params[:id])
    @order.state = if @order.state == 'En espera'
      'En proceso'
    elsif @order.state == 'En proceso'
      'Completado'
    else
      'En espera'
     end

    if @order.save
      redirect_to orders_path
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    @sponsors = Sponsor.all
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:deliver_date, :client_id, :course_club, :logo, :state, :notes, :sponsors)
  end
end
