# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

api_call = ApiCall.create(
  name: "Show the individual memories in the specified goals"
)

resource = Resource.create(
  path: "/v2/goals/:goal_id/memories.json",
  http_method: "GET",
  api_call: api_call
)

parameter1 = Parameter.create(
  name: "goal_id",
  parameter_type: "integer",
  required: true,
  url_parameter: true,
  resource: resource
)

parameter2 = Parameter.create(
  name: "include_items",
  description: "Include memories of items in the goals",
  parameter_type: "boolean",
  required: false,
  url_parameter: false,
  resource: resource
)

parameter3 = Parameter.create(
  name: "include_sentences",
  description: "Include memories of sentences in the goals",
  parameter_type: "boolean",
  required: false,
  url_parameter: false,
  resource: resource
)

resource = Resource.create(
  path: "/v2/memories.json",
  http_method: "GET",
  api_call: api_call
)

parameter1 = Parameter.create(
  name: "goal_ids",
  description: "A comma-separated list of goal ids",
  parameter_type: "string",
  required: false,
  url_parameter: false,
  resource: resource
)

parameter2 = Parameter.create(
  name: "include_items",
  description: "Include memories of items in the goals",
  parameter_type: "boolean",
  required: false,
  url_parameter: false,
  resource: resource
)

parameter3 = Parameter.create(
  name: "include_sentences",
  description: "Include memories of sentences in the goals",
  parameter_type: "boolean",
  required: false,
  url_parameter: false,
  resource: resource
)

#####
# ApiCall 2
#####

api_call = ApiCall.create(
  name: "Show the individual memories for the specified items/sentences"
)

resource = Resource.create(
  path: "/v2/items/:item_id/memory.json",
  http_method: "GET",
  api_call: api_call
)

parameter1 = Parameter.create(
  name: "item_id",
  parameter_type: "integer",
  required: true,
  url_parameter: true,
  resource: resource
)

resource = Resource.create(
  path: "/v2/sentences/:sentence_id/memory.json",
  http_method: "GET",
  api_call: api_call
)

parameter1 = Parameter.create(
  name: "sentence_id",
  parameter_type: "integer",
  required: true,
  url_parameter: true,
  resource: resource
)
