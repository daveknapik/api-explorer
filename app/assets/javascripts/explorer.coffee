# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#api_call_id").change () ->
    $("#resource_id").empty()
    $(".response").empty()

    api_call_id = parseInt($(this).val())
    api_call = _.findWhere(window.api_calls, {id: api_call_id})

    _.each api_call.resources, (element, index, list) ->
      option = $("<option></option>").attr("value", element.id).text(element.http_method + " " + element.path)
      $("#resource_id").append(option);

    $("#resource_id").trigger("change")

  $("#resource_id").change () ->
    $(".parameters").empty()
    $(".response").empty()

    api_call_id = parseInt($("#api_call_id").val())
    api_call = _.findWhere(window.api_calls, {id: api_call_id})

    resource_id = parseInt($(this).val())
    resource = _.findWhere(api_call.resources, {id: resource_id})

    required_parameters = _.where(resource.parameters, {required: true})
    optional_parameters = _.where(resource.parameters, {required: false})

    _.each required_parameters, (element, index, list) ->
      if element.parameter_type == "boolean"
        parameter_group_name = $("<span>").text(element.name + " ")
        parameter_input_true = $("<label>").attr("for", "parameters_" + element.name + "_true").text("true")
        parameter_label_true = $("<input>").attr("type", "radio").attr("name", "parameters[" + element.name + "]").attr("id", "parameters_" + element.name + "_true").val("true")
        parameter_group_name = $("<span>").text(element.name + " ")
        parameter_input_false = $("<label>").attr("for", "parameters_" + element.name + "_false").text("false")
        parameter_label_false = $("<input>").attr("type", "radio").attr("name", "parameters[" + element.name + "]").attr("id", "parameters_" + element.name + "_false").val("false")
        $(".parameters.required").append(parameter_group_name)
        $(".parameters.required").append(parameter_input_true)
        $(".parameters.required").append(parameter_label_true)
        $(".parameters.required").append(parameter_input_false)
        $(".parameters.required").append(parameter_label_false)
        $(".parameters.required").append("<br>")
      else
        parameter_label = $("<label>").attr("for", "parameters_" + element.name).text(element.name)
        parameter_input = $("<input>").attr("type", "text").attr("name", "parameters[" + element.name + "]").attr("id", "parameters_" + element.name)
        $(".parameters.required").append(parameter_label)
        $(".parameters.required").append(parameter_input)
        $(".parameters.required").append("<br>")

    _.each optional_parameters, (element, index, list) ->
      if element.parameter_type == "boolean"
        parameter_group_name = $("<span>").text(element.name + " ")
        parameter_input_true = $("<label>").attr("for", "parameters_" + element.name + "_true").text("true")
        parameter_label_true = $("<input>").attr("type", "radio").attr("name", "parameters[" + element.name + "]").attr("id", "parameters_" + element.name + "_true").val("true")
        parameter_group_name = $("<span>").text(element.name + " ")
        parameter_input_false = $("<label>").attr("for", "parameters_" + element.name + "_false").text("false")
        parameter_label_false = $("<input>").attr("type", "radio").attr("name", "parameters[" + element.name + "]").attr("id", "parameters_" + element.name + "_false").val("false")
        $(".parameters.optional").append(parameter_group_name)
        $(".parameters.optional").append(parameter_input_true)
        $(".parameters.optional").append(parameter_label_true)
        $(".parameters.optional").append(parameter_input_false)
        $(".parameters.optional").append(parameter_label_false)
        $(".parameters.optional").append("<br>")
      else
        parameter_label = $("<label>").attr("for", "parameters_" + element.name).text(element.name)
        parameter_input = $("<input>").attr("type", "text").attr("name", "parameters[" + element.name + "]").attr("id", "parameters_" + element.name)
        $(".parameters.optional").append(parameter_label)
        $(".parameters.optional").append(parameter_input)
        $(".parameters.optional").append("<br>")

  $("form").submit (event) ->
    event.preventDefault()
    $.ajax "/explorer/results",
      type: "GET"
      data: $(this).serialize()
      dataType: "json"
      success: (data, status, jqXHR) ->
        pretty_data = JSON.stringify(data, null, '\t');
        $(".response").html(pretty_data)
      error: (jqXHR, status, errorThrown) ->
        console.log "error"
        console.log status
        console.log errorThrown