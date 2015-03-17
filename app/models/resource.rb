class Resource < ActiveRecord::Base
  include HTTParty
  base_uri "http://api.testing.iknow.jp"

  belongs_to :api_call
  has_many :parameters
  has_many :examples

  def path_with_http_method
    "#{http_method} #{path}"
  end

  def get_api_response(params)
    path_with_parameter_values = self.path

    self.parameters.select {|p| p.url_parameter}.each do |parameter|
      path_with_parameter_values.gsub!(":#{parameter.name}", params[:parameters][parameter.name])
      params[:parameters].delete parameter.name
    end

    api_response = self.class.send(
                    self.http_method.downcase,
                    path_with_parameter_values, 
                    query: params[:parameters].reject {|k,v| v.empty?},
                    basic_auth: {username: params[:username], password: params[:password]},
                    debug_output: $stdout)
    
    JSON.parse(api_response.body)
  end
end
