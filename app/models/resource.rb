class Resource < ActiveRecord::Base
  include HTTParty
  debug_output $stdout
  base_uri "http://api.testing.iknow.jp"

  belongs_to :api_call
  has_many :parameters
  has_many :examples

  delegate :url_parameters, to: :parameters

  def path_with_http_method
    "#{http_method} #{path}"
  end

  def get_api_response_body(api_parameters, basic_auth)
    path_with_parameter_values = self.path

    self.url_parameters.each do |parameter|
      path_with_parameter_values.gsub!(":#{parameter.name}", api_parameters[parameter.name])
      api_parameters.delete parameter.name
    end

    api_response = self.class.send(
                    self.http_method.downcase,
                    path_with_parameter_values, 
                    body: api_parameters.reject {|k,v| !v.empty?}.to_json,
                    basic_auth: basic_auth)
    
    api_response.body
  end
end
