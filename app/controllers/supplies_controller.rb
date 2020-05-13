class SuppliesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_secretary!
  before_action :set_supply, only: [:show, :edit, :update, :destroy]

  # GET /supplies
  # GET /supplies.json
  def index
    @q = Supply.where(in_trash: false).ransack(params[:q])
    @supplies = @q.result.page params[:page]
  end

  def trash
    @q = Supply.where(in_trash: true).ransack(params[:q])
    @supplies = @q.result.page params[:page]
  end

  # GET /supplies/1
  # GET /supplies/1.json
  def show; end

  # GET /supplies/new
  def new
    @supply = Supply.new
  end

  # GET /supplies/1/edit
  def edit; end

  # POST /supplies
  # POST /supplies.json
  def create
    @supply = Supply.new(supply_params)

    respond_to do |format|
      if @supply.save
        format.html { redirect_to supplies_url, notice: 'El insumo se creó correctamente.' }
        format.json { render :show, status: :created, location: supplies_url }
      else
        format.html { render :new }
        format.json { render json: @supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplies/1
  # PATCH/PUT /supplies/1.json
  def update
    respond_to do |format|
      if @supply.update(supply_params)
        format.html { redirect_to supplies_url, notice: 'El insumo se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: supplies_url }
      else
        format.html { render :edit }
        format.json { render json: @supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplies/1
  # DELETE /supplies/1.json
  def destroy
    @supply.in_trash = @supply.in_trash == false
    @supply.save
    respond_to do |format|
      format.html { redirect_to supplies_url, notice: 'El insumo se eliminó correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supply
      @supply = Supply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supply_params
      params.require(:supply).permit(:name, :image, :stock, :description, :term)
    end
end
