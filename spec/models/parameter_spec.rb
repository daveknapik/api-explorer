require 'rails_helper'

describe Parameter do
  describe ".url_parameters" do
    it "returns only parameters where url_parameter is true" do
      resource = FactoryGirl.create :resource
      url_parameter = FactoryGirl.create(:parameter, url_parameter: true, resource: resource)
      non_url_parameter = FactoryGirl.create(:parameter, url_parameter: false, resource: resource)
      expect(resource.url_parameters).to contain_exactly(url_parameter)
    end
  end
end
