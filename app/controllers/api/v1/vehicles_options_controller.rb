class Api::V1::VehiclesOptionsController < ApplicationController
  before_action :set_vehicle_option, only: :destroy

  def create
    @vehicle_option = VehiclesOption.create!(vehicle_option_params)
    json_response(@vehicle_option, :created, :vehicle)
  end

  private

  def vehicle_option_params
    params.permit(:id, :vehicle_id, :option_id)
  end
end
