class Api::V1::VehiclesController < ApplicationController
  def index
    json_response(Vehicle.all)
  end

  def show
    json_response(Vehicle.find(params[:id]))
  end

  def create
    @vehicle = Vehicle.create(vehicle_params)
    json_response(@vehicle, :created)
  end
end


private

def vehicle_params
  params.permit(:id, :make, :model)
end
