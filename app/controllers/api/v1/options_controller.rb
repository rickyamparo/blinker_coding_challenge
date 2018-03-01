class Api::V1::OptionsController < ApplicationController
  def index
    json_response(Option.all, :ok, :vehicles)
  end

  def show
    json_response(Option.find(params[:id]), :ok, :vehicles)
  end

  def create
    @option = Option.create!(option_params)
    json_response(@option, :created, :vehicles)
  end

  def update
    @option = Option.find(params[:id])
    @option.update(option_params)
    head :no_content
  end

  def destroy
    @option = Option.find(params[:id])
    @option.destroy
  end

  private

  def option_params
    params.permit(:id, :name)
  end

end
