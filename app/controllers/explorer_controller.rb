class ExplorerController < ApplicationController
  def index
    # url = "http://api.testing.iknow.jp/v2/goals/594775/memories.json"
    @api_calls = ApiCall.includes(resources: [:parameters, :examples])
  end

  def get_api_response
    resource = Resource.find params[:resource_id]

    render json: resource.get_api_response_body(
      params[:parameters],
      {username: params[:username], password: params[:password]}
    )
  end
end
