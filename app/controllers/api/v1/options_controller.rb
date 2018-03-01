class Api::V1::OptionsController < ApplicationController
  before_action :set_option, only: [:show, :update, :destroy]

  def index
    json_response(Option.all, :ok, :vehicles)
  end

  def show
    json_response(@option, :ok, :vehicles)
  end

  def create
    @option = Option.create!(option_params)
    json_response(@option, :created, :vehicles)
  end

  def update
    @option.update(option_params)
    head :no_content
  end

  def destroy
    @option.destroy
    head: no_content
  end

  private

  def option_params
    params.permit(:id, :name)
  end

  def set_option
    @option = Option.find(params[:id])
  end

end
