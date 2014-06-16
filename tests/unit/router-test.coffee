App = undefined

routesTo = (url, route_name) ->
  visit url
  andThen ->
    current_route = App.__container__.lookup("controller:application").
      currentRouteName
    equal current_route, route_name, "Expected " + route_name + ", got: " +
      current_route

module 'Router unit',
  setup: ->
    App = startApp()
  teardown: ->
    Ember.run(App, 'destroy')

test "root route", ->
  routesTo('/', 'map')

test "meeting route", ->
  routesTo('/meeting/h4sh', 'meeting')

test "new meeting route", ->
  routesTo('/meeting/new', 'meeting.new')