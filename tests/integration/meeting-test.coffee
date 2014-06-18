App = undefined

module 'Meeting integration',
  setup: ->
    App = startApp()
  # teardown: ->
  #   Ember.run(App, 'destroy')

test "new meeting page", ->
  visit "/meetings/new"
  andThen ->
    input_fields = find(".form-fields li").length
    ok input_fields >= 1, "Input field not found"

test "new meeting page creates and then redirects to meeting", ->
  visit("/meetings/new")
  andThen ->
    click "#meeting_form_submit"
    andThen ->
      header_text = find("h1").text()
      expected_result = "Bermuda Triangle Meeting"
      equal header_text, expected_result, "Expected: #{ expected_result }, got: #{ header_text }"

test "meeting page", ->
  visit "/meetings/h4sh"
  andThen ->
    header_text = find("h1").text()
    expected_result = "Bermuda Triangle Meeting"
    equal header_text, expected_result, "Expected: #{ expected_result }, got: #{ header_text }"