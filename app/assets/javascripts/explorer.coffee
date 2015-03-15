# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#api_call_id").change () ->
    $("#resource_id").empty()

    api_call_id = parseInt($(this).val())
    api_call = _.findWhere(window.api_calls, {id: api_call_id})

    _.each api_call.resources, (element, index, list) ->
      option = $("<option></option>").attr("value", element.id).text(element.http_method + " " + element.path)
      $("#resource_id").append(option);

    $("#resource_id").trigger("change")

  $("#resource_id").change () ->
    $(".parameters").empty()

    api_call_id = parseInt($("#api_call_id").val())
    api_call = _.findWhere(window.api_calls, {id: api_call_id})

    resource_id = parseInt($(this).val())
    resource = _.findWhere(api_call.resources, {id: resource_id})

    required_parameters = _.where(resource.parameters, {required: true})
    optional_parameters = _.where(resource.parameters, {required: false})

    _.each required_parameters, (element, index, list) ->
      parameter_label = $("<label>").attr("for", "parameters_" + element.name).text(element.name)
      parameter_input = $("<input>").attr("type", "text").attr("name", "parameters[" + element.name + "]").attr("id", "parameters_" + element.name)
      $(".parameters.required").append(parameter_label)
      $(".parameters.required").append(parameter_input)

    _.each optional_parameters, (element, index, list) ->
      parameter_label = $("<label>").attr("for", "parameters_" + element.name).text(element.name)
      parameter_input = $("<input>").attr("type", "text").attr("name", "parameters[" + element.name + "]").attr("id", "parameters_" + element.name)
      $(".parameters.optional").append(parameter_label)
      $(".parameters.optional").append(parameter_input)