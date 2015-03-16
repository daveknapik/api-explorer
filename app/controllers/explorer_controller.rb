class ExplorerController < ApplicationController
  def index
    # url = "http://api.testing.iknow.jp/v2/goals/594775/memories.json"
    @api_calls = ApiCall.includes(resources: [:parameters, :examples])
  end

  def get_api_response
    resource = Resource.find params[:resource_id]

    path = resource.path

    resource.parameters.select {|p| p.url_parameter}.each do |parameter|
      path.gsub!(":#{parameter.name}", params[:parameters][parameter.name])
      params[:parameters].delete parameter.name
    end

    api_response = HTTParty.send(
                    resource.http_method.downcase,
                    "http://api.testing.iknow.jp" + path, 
                    query: params[:parameters],
                    basic_auth: {username: params[:username], password: params[:password]},
                    debug_output: $stdout)
    parsed_api_response_body = JSON.parse(api_response.body)
    render json: parsed_api_response_body
  end
end
