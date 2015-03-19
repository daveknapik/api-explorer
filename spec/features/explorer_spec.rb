require 'rails_helper'

feature "API Explorer", js: true do
  before(:each) do
    Rails.application.load_seed
  end

  scenario "making an API call" do
    visit root_path
    expect(page).to have_select "api_call_id", options: ["Show the individual memories in the specified goals", "Show the individual memories for the specified items/sentences"]
    expect(page).to have_select "resource_id", options: ["GET /v2/goals/:goal_id/memories.json", "GET /v2/memories.json"]
  
    within ".parameters.required" do
      expect(page).to have_field "parameters[goal_id]"
    end

    within ".parameters.optional" do
      expect(page).to have_field "parameters_include_items_true"
      expect(page).to have_field "parameters_include_items_false"
      expect(page).to have_field "parameters_include_sentences_true"
      expect(page).to have_field "parameters_include_sentences_false"
    end

    select "Show the individual memories for the specified items/sentences", from: "api_call_id"
    expect(page).to have_select "resource_id", options: ["GET /v2/items/:item_id/memory.json", "GET /v2/sentences/:sentence_id/memory.json"]
  
    select "Show the individual memories in the specified goals", from: "api_call_id"
    expect(page).to have_select "resource_id", options: ["GET /v2/goals/:goal_id/memories.json", "GET /v2/memories.json"]

    fill_in "parameters[goal_id]", with: "594775"
    fill_in "username", with: "zev"
    fill_in "password", with: "cerego"
    click_button "Get API response"
    expect(page).to have_css('.response', text: 'content_domain')
  end
end