class HasUsedSuppliesController < ApplicationController
  before_action :authenticate_secretary!, only: [:show, :edit, :update, :destroy]
  before_action :set_has_used_supply, only: [:show, :edit, :update, :destroy]

  # GET /has_used_supplies
  # GET /has_used_supplies.json
  def index
    params[:q] ||= {}
    if params[:q][:created_at_lteq].present?
      params[:q][:created_at_lteq] = params[:q][:created_at_lteq].to_date.end_of_day
    end

    # Filter data by search send by view
    @q = HasUsedSupply.includes(:order, :supply).ransack(params[:q])
    # Paginate the result
    @has_used_supplies = @q.result.page(params[:page]).per(params[:per])
  end

  # GET /has_used_supplies/1
  # GET /has_used_supplies/1.json
  def show
  end

  # GET /has_used_supplies/new
  def new
    @has_used_supply = HasUsedSupply.new
  end

  # GET /has_used_supplies/1/edit
  def edit
  end

  # POST /has_used_supplies
  # POST /has_used_supplies.json
  def create
    @has_used_supply = HasUsedSupply.new
    @has_used_supply.supplies = params[:supplies]
    @has_used_supply.orders = params[:has_used_supply][:order_id]
    @order = Order.find(params[:has_used_supply][:order_id])

    # Discount stock
    @has_used_supply.discount_stock

    # Update state of order
    @order.state = ('Completado' if @order.state == 'En proceso')
    redirect_to @order if @order.save
  end

  # PATCH/PUT /has_used_supplies/1
  # PATCH/PUT /has_used_supplies/1.json
  def update
    respond_to do |format|
      if @has_used_supply.update(has_used_supply_params)
        format.html { redirect_to @has_used_supply, notice: 'Has used supply was successfully updated.' }
        format.json { render :show, status: :ok, location: @has_used_supply }
      else
        format.html { render :edit }
        format.json { render json: @has_used_supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /has_used_supplies/1
  # DELETE /has_used_supplies/1.json
  def destroy
    @has_used_supply.destroy
    respond_to do |format|
      format.html { redirect_to has_used_supplies_url, notice: 'Has used supply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_has_used_supply
    @has_used_supply = HasUsedSupply.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def has_used_supply_params
    params.require(:has_used_supply).permit(:order_id, :supply_id, :quantity, :supplies)
  end
end
