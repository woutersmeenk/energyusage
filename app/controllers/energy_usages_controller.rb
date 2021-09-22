class EnergyUsagesController < ApplicationController
  before_action :set_energy_usage, only: [:show, :edit, :update, :destroy]

  # GET /energy_usages
  def index
    @energy_usages = EnergyUsage.all
  end

  # GET /energy_usages/1
  def show
  end

  # GET /energy_usages/new
  def new
    @energy_usage = EnergyUsage.new
  end

  # GET /energy_usages/1/edit
  def edit
  end

  # POST /energy_usages
  def create
    @energy_usage = EnergyUsage.new(energy_usage_params)

    if @energy_usage.save
      redirect_to @energy_usage, notice: 'Energy usage was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /energy_usages/1
  def update
    if @energy_usage.update(energy_usage_params)
      redirect_to @energy_usage, notice: 'Energy usage was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /energy_usages/1
  def destroy
    @energy_usage.destroy
    redirect_to energy_usages_url, notice: 'Energy usage was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_energy_usage
      @energy_usage = EnergyUsage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def energy_usage_params
      params.require(:energy_usage).permit(:period_start, :amount, :energy_meter_id)
    end
end
