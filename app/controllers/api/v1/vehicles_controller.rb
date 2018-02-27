class Api::V1::VehiclesController < ApplicationController
  def index
    render json: Vehicle.all
  end

  def show
    render json: Vehicle.find(params[:id])
  end
end
