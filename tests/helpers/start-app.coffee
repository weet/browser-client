`import Application from 'appkit/app'`
`import Router from 'appkit/router'`

startApp = (attrs) ->
  App = undefined
  attributes = Ember.merge(
    rootElement: "#ember-testing"
    LOG_ACTIVE_GENERATION: false
    LOG_VIEW_LOOKUPS: false
  , attrs)
  Router.reopen location: "none"
  Ember.run ->
    App = Application.create(attributes)
    App.setupForTesting()
    App.injectTestHelpers()

  App.reset()

  meetings = [
    id: "h4sh"
    name: "Bermuda Triangle Meeting"
    created: "2014-06-10T01:38:38.934Z"
    geojsonResult: "{\"color\": \"#0000FF\", \"type\": \"GeometryCollection\", \"geometries\": [{\"type\": \"MultiPolygon\", \"coordinates\": [[[[-82.190262, 25.774252], [-65.118292, 17.466465], [-63.75737, 34.321384], [-82.190262, 25.774252]], [[-80.190262, 25.774252], [-64.75737, 32.321384], [-66.118292, 18.466465], [-80.190262, 25.774252]]]]}, {\"color\": \"#FF0000\", \"text\": \"The <strong>center</strong> of the <a href=\\\"http://en.wikipedia.org/wiki/Bermuda_Triangle\\\">Bermuda Triangle</a>!\", \"type\": \"Point\", \"coordinates\": [-70.35530800000001, 25.85403366666667], \"title\": \"Click Me!\"}], \"title\": \"Bermuda Triangle\"}" 
  ]
  server = new Pretender(->
    @get "/api/meetings/:id", (request) ->
      meeting = meetings.find((meeting) ->
        meeting if meeting.id == request.params.id
      )
      [ 200,
        "Content-Type": "application/json"
      , JSON.stringify(meeting) ]

    @post "/api/meetings", (request) ->
      [ 200,
        "Content-Type": "application/json"
      , JSON.stringify(meetings[0]) ]
  )
  App

`export default startApp`
