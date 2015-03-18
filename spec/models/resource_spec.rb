require 'rails_helper'

describe Resource do
  describe "#get_api_response_body" do
    it "issues an API call to the resource's path with the supplied parameters and auth credentials" do
      basic_auth = {username: "foo", password: "bar"}
      resource = FactoryGirl.create :resource
      api_response = double(:api_response, body: "foobar")
      allow(Resource).to receive(:get) { api_response }
      expect(Resource).to receive(:get).with(resource.path, {body: anything(), basic_auth: basic_auth})
      resource.get_api_response_body({},basic_auth)
    end
  end
end
