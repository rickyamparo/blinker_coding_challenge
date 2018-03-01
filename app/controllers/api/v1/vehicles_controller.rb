class Api::V1::VehiclesController < ApplicationController
  def index
    json_response(Vehicle.all)
  end

  def show
    json_response(Vehicle.find(params[:id]))
  end

  def create
    @vehicle = Vehicle.create!(vehicle_params)
    json_response(@vehicle, :created)
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    @vehicle.update(vehicle_params)
    head :no_content
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    head :no_content
  end
end


private

def vehicle_params
  params.permit(:id, :make, :model)
end
