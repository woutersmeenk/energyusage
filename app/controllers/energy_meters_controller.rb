class EnergyMetersController < ApplicationController
  before_action :set_energy_meter, only: [:show, :edit, :update, :destroy]

  # GET /energy_meters
  def index
    @energy_meters = EnergyMeter.all
  end

  # GET /energy_meters/1
  def show
  end

  # GET /energy_meters/new
  def new
    @energy_meter = EnergyMeter.new
  end

  # GET /energy_meters/1/edit
  def edit
  end

  # POST /energy_meters
  def create
    @energy_meter = EnergyMeter.new(energy_meter_params)

    if @energy_meter.save
      redirect_to @energy_meter, notice: 'Energy meter was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /energy_meters/1
  def update
    if @energy_meter.update(energy_meter_params)
      redirect_to @energy_meter, notice: 'Energy meter was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /energy_meters/1
  def destroy
    @energy_meter.destroy
    redirect_to energy_meters_url, notice: 'Energy meter was successfully destroyed.'
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
