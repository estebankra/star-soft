class OrderDetailsController < ApplicationController
  before_action :set_order_detail, only: [:show, :edit, :update, :destroy]

  # GET /order_details
  # GET /order_details.json
  def index
    @order_details = OrderDetail.all
  end

  # GET /order_details/1
  # GET /order_details/1.json
  def show
  end

  # GET /order_details/new
  def new
    @order_detail = OrderDetail.new
  end

  # GET /order_details/1/edit
  def edit
  end

  # POST /order_details
  # POST /order_details.json
  def create
    @order_detail = OrderDetail.new(order_detail_params)
    @order = Order.find(params[:order_detail][:order_id])

    respond_to do |format|
      if @order_detail.save
        format.html {redirect_to @order, notice: 'El detalle se agregó correctamente.'}
        format.json {render :show, status: :created, location: @order_detail}
      else
        format.html {render :new}
        format.json {render json: @order_detail.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /order_details/1
  # PATCH/PUT /order_details/1.json
  def update
    respond_to do |format|
      if @order_detail.update(order_detail_params)
        format.html {redirect_to @order, notice: 'Order detail was successfully updated.'}
        format.json {render :show, status: :ok, location: @order_detail}
      else
        format.html {render :edit}
        format.json {render json: @order_detail.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /order_details/1
  # DELETE /order_details/1.json
  def destroy
    order = nil
    HasDetail.all.each do | hasDetail |
      if hasDetail.order_detail.id == @order_detail.id
        order = hasDetail.order
      end
    end
    @order_detail.destroy

    respond_to do |format|
      format.html {redirect_to order, notice: 'El detalle se eliminó correctamente.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order_detail
    @order_detail = OrderDetail.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_detail_params
    params.require(:order_detail).permit(:name, :number, :size, :quantity, :notes, :order_id)
  end
end