MeetingNewRoute = Ember.Route.extend(

  model: ->
    @store.createRecord('meeting')
)

`export default MeetingNewRoute`