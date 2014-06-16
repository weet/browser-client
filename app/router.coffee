Router = Ember.Router.extend()
Router.map ->
  @route 'map', path: '/'
  @route 'meeting.new', path: 'meeting/new'
  @resource 'meeting', path: '/meeting/:id'

Router.reopen
  location: "history"

`export default Router`
