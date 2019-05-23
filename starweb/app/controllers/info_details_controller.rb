class InfoDetailsController < ApplicationController
  before_action :set_info_detail, only: [:show, :edit, :update, :destroy]

  # GET /info_details
  # GET /info_details.json
  def index
    @info_details = InfoDetail.all
  end

  # GET /info_details/1
  # GET /info_details/1.json
  def show
  end

  # GET /info_details/new
  def new
    @info_detail = InfoDetail.new
  end

  # GET /info_details/1/edit
  def edit
  end

  # POST /info_details
  # POST /info_details.json
  def create
    @info_detail = InfoDetail.new(info_detail_params)

    respond_to do |format|
      if @info_detail.save
        format.html { redirect_to @info_detail, notice: 'Info detail was successfully created.' }
        format.json { render :show, status: :created, location: @info_detail }
      else
        format.html { render :new }
        format.json { render json: @info_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /info_details/1
  # PATCH/PUT /info_details/1.json
  def update
    respond_to do |format|
      if @info_detail.update(info_detail_params)
        format.html { redirect_to @info_detail, notice: 'Info detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @info_detail }
      else
        format.html { render :edit }
        format.json { render json: @info_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /info_details/1
  # DELETE /info_details/1.json
  def destroy
    @info_detail.destroy
    respond_to do |format|
      format.html { redirect_to info_details_url, notice: 'Info detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_info_detail
      @info_detail = InfoDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def info_detail_params
      params.require(:info_detail).permit(:firstname, :lastname, :number, :size)
    end
end
