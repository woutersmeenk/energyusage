class EnergyMetersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_energy_meter, only: [:show, :edit, :update, :destroy]

  def index
    @energy_meters = EnergyMeter.all
  end

  def show
  end

  def new
    @energy_meter = EnergyMeter.new
  end

  def edit
  end

  def create
    @energy_meter = EnergyMeter.new(energy_meter_params)

    if @energy_meter.save
      redirect_to @energy_meter, notice: 'Energy meter was successfully created.'
    else
      render :new
    end
  end

  def update
    if @energy_meter.update(energy_meter_params)
      redirect_to @energy_meter, notice: 'Energy meter was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @energy_meter.destroy
      redirect_to energy_meters_url, notice: 'Energy meter was successfully deleted.'
    else
      redirect_to @energy_meter, notice: 'Energy meter could not be deleted.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_energy_meter
      @energy_meter = EnergyMeter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def energy_meter_params
      params.require(:energy_meter).permit(:name, :start, :end)
    end
end
