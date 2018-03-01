module Response
  def json_response(object, status = :ok, relationship = :options)
    render json: object, status: status, include: relationship
  end
end
