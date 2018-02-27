class Api::V1::VehiclesController < ApplicationController
  def index
    render json: Vehicle.all
  end
end
