require 'rails_helper'

describe Resource do
  describe "#get_api_response_body" do
    it "issues an API call to the resource's path with the supplied parameters and auth credentials" do
      basic_auth = {username: "foo", password: "bar"}
      resource = FactoryGirl.create(:resource, path: "/v2/abc/:def/ghi/:jkl")

      url_parameters, optional_parameters = Array.new, Array.new

      url_parameters << FactoryGirl.create(:url_parameter, name: "def", resource: resource)
      url_parameters << FactoryGirl.create(:url_parameter, name: "jkl", resource: resource)
      3.times { optional_parameters << FactoryGirl.create(:parameter, resource: resource) }

      api_parameters = {
        "def" => "mno",
        "jkl" => 123,
        "#{optional_parameters[0].name}" => "xyz",
        "#{optional_parameters[1].name}" => true,
        "#{optional_parameters[2].name}" => nil
      }

      body = {
        "#{optional_parameters[0].name}" => "xyz",
        "#{optional_parameters[1].name}" => true
      }

      api_response = double(:api_response, body: "foobar")
      allow(Resource).to receive(:get) { api_response }
      expect(Resource).to receive(:get).with("/v2/abc/mno/ghi/123", {body: body, basic_auth: basic_auth})
      resource.get_api_response_body(api_parameters, basic_auth)
    end
  end
end
