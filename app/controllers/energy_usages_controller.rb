class EnergyUsagesController < ApplicationController
  before_action :set_energy_usage, only: [:edit, :update, :destroy]
  before_action :set_energy_meter

  def new
    @energy_usage = EnergyUsage.new
  end

  def edit
  end

  def create
    @energy_usage = EnergyUsage.new(energy_usage_params)
    @energy_usage.energy_meter_id = @energy_meter.id
    if @energy_usage.save
      redirect_to @energy_meter, notice: 'Energy usage was successfully created.'
    else
      render :new
    end
  end

  def update
    if @energy_usage.update(energy_usage_params)
      redirect_to @energy_meter, notice: 'Energy usage was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @energy_usage.destroy
    redirect_to @energy_meter, notice: 'Energy usage was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_energy_usage
      @energy_usage = EnergyUsage.find(params[:id])
    end

    def set_energy_meter
      @energy_meter = EnergyMeter.find(params[:energy_meter_id])
    end

    # Only allow a list of trusted parameters through.
    def energy_usage_params
      params.require(:energy_usage).permit(:period_start, :amount, :energy_meter_id)
    end
end
