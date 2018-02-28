class Api::V1::VehiclesController < ApplicationController
  def index
    json_response(Vehicle.all)
  end

  def show
    json_response(Vehicle.find(params[:id]))
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if params[:options]
      @vehicle.options = (params[:options].split(','))
    end
    @vehicle.save!
    json_response(@vehicle, :created)
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    @vehicle.update(vehicle_params)
    if params[:options]
      @vehicle.update(options: params[:options].split(','))
    end
    @vehicle.save!
    head :no_content
  end
end


private

def vehicle_params
  params.permit(:id, :make, :model, :options)
end
