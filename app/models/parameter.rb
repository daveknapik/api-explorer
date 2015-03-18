class Parameter < ActiveRecord::Base
  belongs_to :resource

  scope :url_parameters, -> { where(url_parameter: true) }
end
