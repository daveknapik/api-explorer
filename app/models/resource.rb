class Resource < ActiveRecord::Base
  belongs_to :api_call
  has_many :parameters
  has_many :examples

  def path_with_http_method
    "#{http_method} #{path}"
  end
end
