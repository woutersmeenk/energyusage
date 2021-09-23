class EnergyUsagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_energy_usage, only: [:edit, :update, :toggle_approved, :destroy]
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
    if !can_edit?
      redirect_to @energy_meter, notice: 'Only managers can delete approved energy usages.'
      return
    end
    if @energy_usage.update(energy_usage_params)
      redirect_to @energy_meter, notice: 'Energy usage was successfully updated.'
    else
      render :edit
    end
  end

  def toggle_approved
    @energy_usage.approved = !@energy_usage.approved?
    if !current_user.manager?
      redirect_to @energy_meter, notice: 'Only managers can approve energy usage.'
      return
    end
    if @energy_usage.save
      redirect_to @energy_meter, notice: 'Energy usage was successfully updated.'
    end
  end

  def destroy
    if !can_edit?
      redirect_to @energy_meter, notice: 'Only managers can delete approved energy usages.'
      return
    end
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

    # We can only edit the energy usage when it is not approved or we are a manager
    def can_edit?
      return !@energy_usage.approved? || current_user.manager? 
    end

    # Only allow a list of trusted parameters through.
    def energy_usage_params
      params.require(:energy_usage).permit(:period_start, :amount, :energy_meter_id)
    end
end
