Router = Ember.Router.extend()
Router.map ->
  @route 'map', path: '/'
  @route 'meetings.new', path: 'meetings/new'
  @route 'meetings.show', path: 'meetings/:id'

Router.reopen
  location: "history"

`export default Router`
