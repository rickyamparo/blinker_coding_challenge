class Api::V1::VehiclesController < ApplicationController
  def index
    json_response(Vehicle.all)
  end

  def show
    json_response(Vehicle.find(params[:id]))
  end
end
